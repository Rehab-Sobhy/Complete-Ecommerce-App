import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_commerce_app/core/utils/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List images = [
    "assets/images/photo_2024-04-26_02-11-05.jpg",
    "assets/images/photo_2024-04-26_02-11-05.jpg",
    "assets/images/photo_2024-04-26_02-11-05.jpg",
    "assets/images/photo_2024-04-26_02-11-05.jpg",
    "assets/images/photo_2024-04-26_02-11-05.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Do shopping Now 🔥",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Categories"),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: Expanded(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, image: images[index]),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
