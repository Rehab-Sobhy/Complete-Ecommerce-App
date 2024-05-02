import 'package:flutter/material.dart';
import 'package:flutter_commerce_app/core/utils/styles.dart';

class PageViewItem extends StatelessWidget {
  final String? image;
  final String text;
  const PageViewItem({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .7,
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Container(
              height: MediaQuery.of(context).size.height * .45,
              child: Image.asset(
                "$image",
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: 5,
          ),
          Text(
            "$text",
            style: Styles.TextStyle20.copyWith(color: Colors.deepOrange),
          )
        ],
      ),
    );
  }
}
