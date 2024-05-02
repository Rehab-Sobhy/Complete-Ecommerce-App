import 'package:flutter/material.dart';
import 'package:flutter_commerce_app/Features/account/presentation/views/account_view.dart';
import 'package:flutter_commerce_app/Features/lay_out_screen/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List Screens = [
    HomePage(),
    AccountView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: const Color(0xF7FCF6F8),
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
