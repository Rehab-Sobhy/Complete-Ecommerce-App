import 'dart:core';

class ProductModel {
  String? description;
  String? price;
  String? name;
  String? oldPrice;
  String? image;
  String? discount;
  String? id;
  ProductModel.fromJson({required Map<String, dynamic> data}) {
    description = data['description'].toString();
    id = data['id'].toInt();
    image = data['image'].toString();
    price = data['ptice'].toInt();
    oldPrice = data['oldPrice'].toInt();
    discount = data['discount'].toInt();
    name = data['name'].toInt();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'discount': discount,
      'oldPrice': oldPrice,
    };
  }
}
