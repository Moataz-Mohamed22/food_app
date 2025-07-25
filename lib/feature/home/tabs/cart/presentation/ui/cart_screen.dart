import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/theme/app_styles.dart';

import '../manager/cart_cubit.dart';
import '../manager/cart_states.dart';



class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartUpdated) {
            final cartItems = state.cartItems;

            final totalPrice = cartItems.fold<double>(
              0.0,
                  (sum, meal) => sum + meal.price,
            );

            if (cartItems.isEmpty) {
              return Center(
                child: Text("Your cart is empty.", style: AppStyles.bold25Black),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16.r),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final meal = cartItems[index];
                      return Card(
                        margin: EdgeInsets.only(bottom: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.asset(meal.image, width: 60.w, height: 60.h, fit: BoxFit.cover),
                          ),
                          title: Text(meal.name, style: AppStyles.semiBold17Black),
                          subtitle: Text("\$${meal.price.toStringAsFixed(2)}"),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              context.read<CartCubit>().removeFromCart(meal);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                  color: Colors.grey.shade200,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total:", style: AppStyles.bold25Black),
                          Text("\$${totalPrice.toStringAsFixed(2)}", style: AppStyles.bold25Black),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Checkout Success"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 32.w),
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text("Checkout", style: AppStyles.semiBold17White),
                      ),
                    ],
                  ),
                ),
              ],
            );
            ;
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
