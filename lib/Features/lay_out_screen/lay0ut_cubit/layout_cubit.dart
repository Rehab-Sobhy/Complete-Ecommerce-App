import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_commerce_app/Features/lay_out_screen/lay0ut_cubit/layout_cubit_states.dart';
import 'package:flutter_commerce_app/models/banar_model.dart';
import 'package:flutter_commerce_app/models/category.dart';
import 'package:flutter_commerce_app/models/product_model.dart';
import 'package:flutter_commerce_app/models/user_model.dart';
import 'package:flutter_commerce_app/shared/shared.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class LayOutCubit extends Cubit<LayoutCubitState> {
  LayOutCubit() : super(LayOutIntialize());

  UserModel? userModel;
  List<BannerModel> banners = [];
  List<ProductModel> products = [];
  List<CategoriesModel> categories = [];
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

  Future<void> getBannersData() async {
    Response response =
        await https.get(Uri.parse("https://student.valuxapps.com/api/banners"));
    final responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']) {
        banners.add(BannerModel.fromJson(data: item));
      }
      emit(GetBannerSuccess());
    } else {
      emit(GetBannerFailed());
    }
  }

  Future<void> getCategoriesData() async {
    Response response = await https
        .get(Uri.parse("https://student.valuxapps.com/api/categories"));
    final responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['data']) {
        banners.add(BannerModel.fromJson(data: item));
      }
      emit(GetCategoriesSuccess());
    } else {
      emit(GetCategoriesFailed());
    }
  }

  Future<void> getProductsData() async {
    Response response = await https
        .get(Uri.parse("https://student.valuxapps.com/api/home"), headers: {
      'Authorization': token!,
      "lang": "en",
    });
    final responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['products']) {
        products.add(ProductModel.fromJson(data: item));
      }
      emit(GetProductSuccess());
    } else {
      emit(GetProductFailed());
    }
  }

  List<ProductModel> filterproducteList = [];
  void filterProducts({required String input}) {
    filterproducteList = products
        .where((element) =>
            element.name!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();
    emit(FilteringProducts());
  }
}
