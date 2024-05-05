class CategoriesModel {
  String? id;
  String? url;
  String? title;

  CategoriesModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'];
    url = data['url'];
    title = data['title'];
  }

  //method to map

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'title': title,
    };
  }
}
