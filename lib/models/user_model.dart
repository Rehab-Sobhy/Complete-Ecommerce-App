class UserModel {
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;

  UserModel({this.email, this.image, this.name, this.phone, this.token});

  UserModel.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    name = data['phone'];
    name = data['token'];
    name = data['email'];
    name = data['image'];
  }
}
