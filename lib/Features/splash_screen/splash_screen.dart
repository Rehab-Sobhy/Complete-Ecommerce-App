import 'package:flutter/material.dart';

// ignore: implementation_imports

import 'package:flutter_commerce_app/core/utils/styles.dart';
import 'package:flutter_commerce_app/Features/lay_out_screen/home.dart';
import 'package:flutter_commerce_app/Features/pageView/presntation/views/on_boarding_page_view.dart';
import 'package:flutter_commerce_app/shared_preferences/shared_pref.dart';

// ignore: camel_case_types
class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

// ignore: camel_case_types
class _Splash_ScreenState extends State<Splash_Screen> {
  String token = CachNetwork().getData(key: 'token');
  @override
  // void initState() {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     token != null || token != " "
  //         ? Navigator.pushReplacement(context,
  //             MaterialPageRoute(builder: (context) => const HomePage()))
  //         : Navigator.pushReplacement(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) => const OnBoardingPageView()));
  //   });
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: mainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "🅔 🅒🅞🅜🅜🅔🅡🅒🅔 🅐🅟🅟",
              style: Styles.TextStyle30.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
