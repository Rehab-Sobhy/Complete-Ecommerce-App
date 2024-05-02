class CategoriesModel {
  String? id;
  String? url;

  CategoriesModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'];
    url = data['url'];
  }

  //method to map

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
    };
  }
}
