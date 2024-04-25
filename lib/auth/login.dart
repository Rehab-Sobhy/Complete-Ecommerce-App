import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_commerce_app/auth/auth_cubit/auth_states.dart';
import 'package:flutter_commerce_app/auth/register.dart';
import 'package:flutter_commerce_app/core/utils/styles.dart';

import '../core/widgets/custom_texr_field.dart';
import 'auth_cubit/auth_cubit.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
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
                    "Loginnnn",
                    style: Styles.TextStyle30,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    hinttext: 'User Name',
                    text_Field_Icon: Icon(Icons.person),
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    hinttext: 'Email',
                    text_Field_Icon: Icon(Icons.email),
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    hinttext: 'Phone',
                    text_Field_Icon: Icon(Icons.phone),
                    controller: phoneController,
                  ),
                  CustomTextFormField(
                    hinttext: 'Password',
                    text_Field_Icon: Icon(Icons.password_outlined),
                    controller: passwordController,
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
                    child: Text("Register"),
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
              MaterialPageRoute(builder: (context) => RegisterScreen()));
        }
      },
    );
  }
}
