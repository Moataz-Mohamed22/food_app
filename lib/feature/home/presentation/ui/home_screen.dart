import 'package:flutter/material.dart';
import 'package:food_app/config/theme/colors.dart';
import 'package:food_app/feature/home/tabs/cart/presentation/ui/cart_screen.dart';
import 'package:food_app/feature/home/tabs/menu/presentation/pages/menu_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> tabs = [
    MenuScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: IndexedStack(
      index: selectedIndex,
      children: tabs,
    ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.secondary,
        backgroundColor: AppColors.primary,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
