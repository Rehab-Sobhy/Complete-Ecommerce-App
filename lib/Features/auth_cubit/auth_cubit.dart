import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_commerce_app/Features/auth_cubit/auth_states.dart';
import 'package:flutter_commerce_app/models/product_model.dart';
import 'package:flutter_commerce_app/shared_preferences/shared_pref.dart';

// ignore: unused_import
import 'package:http/http.dart' as https;
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
      Response response = await https.post(
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

  void login({required String password, required String email}) async {
    emit(LoginLoading());
    Response response = await https
        .post(Uri.parse('https://student.valuxapps.com/api/login'), body: {
      'password': password,
      'email': email,
    }, headers: {
      "lang": "eng"
    });
    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body);

        if (data['status'] == true) {
          CachNetwork().getData(key: data['data']['token']);
          emit(LoginSuccess());
        } else {
          emit(LoginFailed(message: data['message']));
        }
      } on Exception catch (e) {
        emit(LoginFailed(message: e.toString()));
      }
    }
  }
}
