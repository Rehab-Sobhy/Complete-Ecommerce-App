import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_commerce_app/Features/account/presentation/views/account_view.dart';
import 'package:flutter_commerce_app/Features/cart/cart.dart';
import 'package:flutter_commerce_app/Features/categories/category.dart';
import 'package:flutter_commerce_app/Features/favourite/favourite.dart';
import 'package:flutter_commerce_app/Features/home_screen/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List Screens = [
    HomePage(),
    const Category_Screen(),
    const FavouriteScreen(),
    const CartScreen(),
    const AccountView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 20,
          selectedFontSize: 30,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.red,
          fixedColor: const Color.fromARGB(247, 0, 0, 0),
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home)),
            BottomNavigationBarItem(icon: Icon(Icons.category)),
            BottomNavigationBarItem(icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_checkout)),
            BottomNavigationBarItem(icon: Icon(Icons.person)),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
      body: Screens[currentIndex],
    );
  }
}
