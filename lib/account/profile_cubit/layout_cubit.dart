import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_commerce_app/account/profile_cubit/layout_cubit_states.dart';
import 'package:flutter_commerce_app/models/user_model.dart';
import 'package:flutter_commerce_app/shared/shared.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class LayOutCubit extends Cubit<LayoutCubitState> {
  LayOutCubit() : super(LayOutIntialize());
  UserModel? userModel;
  void getData() async {
    Response response = await https
        .get(Uri.parse("https://student.valuxapps.com/api/profile"), headers: {
      'Authorization': token!,
      "lang": "en",
    });
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      userModel = UserModel.fromJson(data: responseData['body']);
      emit(GetSuccess());
    } else
      emit(GetFailed(error: responseData['message']));
  }
}
