import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_commerce_app/lay0ut_cubit/layout_cubit_states.dart';
import 'package:flutter_commerce_app/models/banar_model.dart';
import 'package:flutter_commerce_app/models/user_model.dart';
import 'package:flutter_commerce_app/shared/shared.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class LayOutCubit extends Cubit<LayoutCubitState> {
  LayOutCubit() : super(LayOutIntialize());

  UserModel? userModel;
  List<BannarModel> banners = [];
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

  void getBannarData() async {
    emit(GetBannerLoading());
    Response response = await https.get(
      Uri.parse("https://student.valuxapps.com/api/bannars"),
      headers: {"lang": "en"},
    );
    var responseDta = jsonDecode(response.body);
    if (responseDta['status'] == true) {
      for (var item in responseDta['data']) {
        banners.add(BannarModel.fromJson(data: item));
      }
      emit(GetBannerSuccess());
    } else
      emit(GetBannerFailed(error: responseDta['message']));
  }
}
