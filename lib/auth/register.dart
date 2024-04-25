import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_commerce_app/auth/auth_cubit/auth_states.dart';
import 'package:flutter_commerce_app/auth/login.dart';
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
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: ((context, state) {
        return Form(
          key: formKey,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    "SignUp",
                    style: Styles.TextStyle30,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    hinttext: 'User Name',
                    text_Field_Icon: const Icon(Icons.person),
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    hinttext: 'Email',
                    text_Field_Icon: const Icon(Icons.email),
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    hinttext: 'Phone',
                    text_Field_Icon: const Icon(Icons.phone),
                    controller: phoneController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    hinttext: 'Password',
                    text_Field_Icon: const Icon(Icons.password_outlined),
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).register(
                            name: nameController.text,
                            phone: phoneController.text,
                            password: passwordController.text,
                            email: emailController.text);
                      }
                    },
                    child: const Text("Register"),
                    minWidth: double.infinity,
                  )
                ],
              ),
            ),
          ),
        );
      }),
      listener: (context, state) {
        if (state is RegisterSuccsess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Login_Screen()));
        } else {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text('error'),
                  ));
        }
      },
    );
  }
}
