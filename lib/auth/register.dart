import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_commerce_app/auth/auth_cubit/auth_states.dart';
import 'package:flutter_commerce_app/core/utils/styles.dart';

import '../core/widgets/custom_texr_field.dart';
import 'auth_cubit/auth_cubit.dart';

class Regiset_Screen extends StatefulWidget {
  const Regiset_Screen({super.key});

  @override
  State<Regiset_Screen> createState() => _Regiset_ScreenState();
}

class _Regiset_ScreenState extends State<Regiset_Screen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: ((context, state) {
        return Form(
          key: formKey,
          child: Scaffold(
            body: Column(
              children: [
                Text(
                  "SignUp".tr(),
                  style: Styles.TextStyle30,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  hinttext: 'User Name',
                  text_Field_Icon: Icon(Icons.person),
                  validator: (value) {
                    if (state is RegisterSuccsess) {}
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hinttext: 'User Name',
                  text_Field_Icon: Icon(Icons.person),
                  validator: (value) {
                    if (state is RegisterSuccsess) {}
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hinttext: 'User Name',
                  text_Field_Icon: Icon(Icons.person),
                  validator: (value) {
                    if (state is RegisterSuccsess) {}
                  },
                ),
                MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  child: Text("Register"),
                  minWidth: double.infinity,
                )
              ],
            ),
          ),
        );
      }),
      listener: (context, state) {},
    );
  }
}
