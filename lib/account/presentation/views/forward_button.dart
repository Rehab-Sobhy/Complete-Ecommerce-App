import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForwardButton extends StatelessWidget {
  const ForwardButton({super.key, required this.onTap});
final Function ()onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(FontAwesomeIcons.chevronLeft),
      ),
    );
  }
}


