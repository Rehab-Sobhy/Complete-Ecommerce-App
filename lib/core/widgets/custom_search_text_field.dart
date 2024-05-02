import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.OnPressed});
  final Function OnPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(100),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                prefixIcon: IconButton(
                  onPressed: OnPressed(),
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
                hintText: "search",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.black54),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
