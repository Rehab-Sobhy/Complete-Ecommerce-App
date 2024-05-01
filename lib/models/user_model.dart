class UserModel {
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;

  UserModel({this.email, this.image, this.name, this.phone, this.token});

  UserModel.fromJson({required Map<String, dynamic> data}) {
    name = data['name'];
    phone = data['phone'];
    token = data['token'];
    email = data['email'];
    image = data['image'];
  }

  //metod convert to map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'token': token,
      'email': email,
      'image': image,
    };
  }
}
