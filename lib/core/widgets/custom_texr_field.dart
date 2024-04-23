
// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final String hinttext;
  final Icon text_Field_Icon;
 final  Function  validator;
   TextEditingController ? controller1 = TextEditingController();
  CustomTextFormField(
      {super.key, required this.hinttext, required this.text_Field_Icon,this.controller1,required  this.validator});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: (value) => validator (value),
        style: const TextStyle(
          color: Colors.black,
        ),
        controller: controller1,
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
