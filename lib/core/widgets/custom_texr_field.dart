// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final String hinttext;
  final Icon text_Field_Icon;

//  final  Function  validator;
  TextEditingController? controller = TextEditingController();
  CustomTextFormField({
    super.key,
    required this.hinttext,
    required this.text_Field_Icon,
    required TextEditingController controller,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (controller!.text.isEmpty) {
            return "$hinttext must not be empty";
          }
        },
        style: const TextStyle(
          color: Colors.black,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          prefixIcon: text_Field_Icon,
          hintText: hinttext,
          border: OutlineInputBorder(),

          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(50)),
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
