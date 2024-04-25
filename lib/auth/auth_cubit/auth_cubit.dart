import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_commerce_app/auth/auth_cubit/auth_states.dart';

// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(IntialAuthState());

  void register(
      {required String email,
      required String name,
      required String phone,
      required String password}) async {
    emit(RegisterLoading());
    try {
      Response response = await http.post(
        // request Url = base url + method url ( endpoint ) = https://student.valuxapps.com + /api/register
        Uri.parse('https://student.valuxapps.com/api/register'),
        body: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
          'image': "jdfjfj" // الصوره مش شغاله بس لازم ابعت قيمه ك value
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          debugPrint("Response is : $data");
          emit(RegisterSuccsess());
        } else {
          debugPrint("Response is : $data");
          emit(RegisterFailed(message: data['message']));
        }
      }
    } catch (e) {
      debugPrint("Failed to Register , reason : $e");
      emit(RegisterFailed(message: e.toString()));
    }
  }
}
