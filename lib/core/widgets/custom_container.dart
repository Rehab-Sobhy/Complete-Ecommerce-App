import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Color? containerColor;

  final Text containerText;
  final double containerHight;
  final double containerWidih;
  const CustomContainer({
    super.key,
    required this.containerColor,
    required this.containerText, required this.containerHight, required this.containerWidih,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height:containerHight,
        width: containerWidih,
        decoration: BoxDecoration(
            color: containerColor, borderRadius: BorderRadius.circular(30)),
        child: Padding(padding: const EdgeInsets.all(8), child: containerText),
      ),
    );
  }
}
