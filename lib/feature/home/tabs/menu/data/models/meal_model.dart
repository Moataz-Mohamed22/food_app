import '../../../../../../core/utils/app_assets.dart';

class MealModel {
  final String id;
  final String name;
  final String category;
  final String description;
  final double price;
  final bool isVegan;
  final bool isHalal;
  final bool isGlutenFree;
  final String image;

  MealModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.image,
    this.isVegan = false,
    this.isHalal = true,
    this.isGlutenFree = false,
  });
}List<MealModel> meals = [
  MealModel(
    id: 'm1',
    name: 'Korean Chicken Bao',
    category: 'Street Food',
    description: 'Soft bao bun filled with crispy Korean-style chicken and pickles.',
    price: 6.99,
    image: AppAssets.koreanChickenBao,
    isHalal: true,
  ),
  MealModel(
    id: 'm2',
    name: 'Egyptian Koshary Box',
    category: 'Street Food',
    description: 'A hearty mix of rice, pasta, lentils, and crispy onions with tomato sauce.',
    price: 5.49,
    image: AppAssets.koshary,
    isVegan: true,
    isGlutenFree: false,
  ),
  MealModel(
    id: 'm3',
    name: 'Quinoa Salad with Avocado',
    category: 'Healthy',
    description: 'Fresh quinoa tossed with veggies and creamy avocado.',
    price: 7.99,
    image: AppAssets.quinoaSalad,
    isVegan: true,
    isGlutenFree: true,
  ),
  MealModel(
    id: 'm4',
    name: 'Grilled Chicken & Halloumi Wrap',
    category: 'Healthy',
    description: 'Whole wheat wrap with grilled chicken, halloumi, and veggies.',
    price: 8.49,
    image: AppAssets.grilledChicken,
    isHalal: true,
  ),
  MealModel(
    id: 'm5',
    name: 'Beyond Meat Vegan Burger',
    category: 'Burgers',
    description: 'Plant-based patty with vegan mayo and lettuce in a vegan bun.',
    price: 9.49,
    image: AppAssets.beyondMeatBurger,
    isVegan: true,
    isGlutenFree: false,
  ),
  MealModel(
    id: 'm6',
    name: 'Angus Beef Burger',
    category: 'Burgers',
    description: 'Juicy Angus beef with cheese, lettuce, and special sauce.',
    price: 10.99,
    image: AppAssets.angusBurger,
    isHalal: true,
  ),
];
