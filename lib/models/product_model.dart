import 'dart:core';

class ProductModel {
  String? description;
  String? price;
  String? oldPrice;
  String? image;
  String? discount;
  String? id;
  ProductModel({required Map<String, dynamic> data}) {
    description = data['description'].toString();
    id = data['id'].toInt();
    image = data['image'].toString();
    price = data['ptice'].toInt();
    oldPrice = data['oldPrice'].toInt();
    discount = data['discount'].toInt();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'description': description,
      'price': price,
      'discount': discount,
      'oldPrice': oldPrice,
    };
  }
}
