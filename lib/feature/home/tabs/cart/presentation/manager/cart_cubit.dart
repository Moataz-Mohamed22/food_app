import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/feature/home/tabs/menu/data/models/meal_model.dart';

import 'cart_states.dart';





class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<MealModel> _cartItems = [];

  List<MealModel> get cartItems => List.unmodifiable(_cartItems);

  void addToCart(MealModel meal) {
    _cartItems.add(meal);
    emit(CartUpdated(List.from(_cartItems)));
  }

  void removeFromCart(MealModel meal) {
    _cartItems.remove(meal);
    emit(CartUpdated(List.from(_cartItems)));
  }

  void clearCart() {
    _cartItems.clear();
    emit(CartUpdated([]));
  }
}
