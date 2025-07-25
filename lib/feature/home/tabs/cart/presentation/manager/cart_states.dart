

import '../../../menu/data/models/meal_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<MealModel> cartItems;
  CartUpdated(this.cartItems);
}
