import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/theme/app_styles.dart';
import 'package:food_app/config/theme/colors.dart';
import 'package:food_app/feature/home/tabs/menu/data/models/meal_model.dart';

import '../../../cart/presentation/manager/cart_cubit.dart';

class MenuItem extends StatelessWidget {
  final MealModel? mealModel;

  const MenuItem({super.key, this.mealModel});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(mealModel!.name),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: REdgeInsets.all(16),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.asset(
                mealModel!.image,
                height: 200.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.h),
            Text(mealModel!.name, style: AppStyles.bold25Black),
            SizedBox(height: 8.h),
            Text(
              "\$${mealModel!.price.toStringAsFixed(2)}",
              style: AppStyles.semiBold17Black,
            ),
            SizedBox(height: 16.h),
            Text(mealModel!.description, style: AppStyles.regular14Gray),
            SizedBox(height: 16.h),
            Row(
              children: [
                if (mealModel!.isHalal)
                  Chip(
                    label: Text("Halal",  style:AppStyles.semiBold17White),
                    backgroundColor: Colors.green,
                  ),
                if (mealModel!.isVegan)
                  Chip(
                    label: Text("Vegan",  style:AppStyles.semiBold17White),
                    backgroundColor: Colors.lightGreen,
                  ),
                if (mealModel!.isGlutenFree)
                  Chip(
                    label: Text("Gluten Free", style:AppStyles.semiBold17White),
                    backgroundColor: Colors.orange,
                  ),
              ].expand((chip) => [chip, SizedBox(width: 8)]).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onPressed: () {
                context.read<CartCubit>().addToCart(mealModel!);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${mealModel!.name} added to cart!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text(
                "Add to Cart",
                style: AppStyles.semiBold17White,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
