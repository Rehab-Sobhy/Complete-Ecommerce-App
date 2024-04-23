import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_commerce_app/auth/auth_cubit/auth_states.dart';

// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(IntialAuthState());

  void register({
    required String name,
    required String phone,
    required String password,
    required String email,
  }) async {
    Response response = await http.post(
      Uri.parse("https://student.valuxapps.com/api/register"),
      body: {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
      },
      headers: {'lang': "en"},
    );
    // ignore: unused_local_variable
    var responseBody = jsonDecode(response.body);

    if (responseBody['status' == true]) {
      emit(RegisterSuccsess());
    } else
      // ignore: curly_braces_in_flow_control_structures
      emit(RegisterFailed(message: responseBody['message']));
  }
}
