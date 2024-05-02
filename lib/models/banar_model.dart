class BannarModel {
  String? url;
  String? id;
  //constructor 
  BannarModel({required this.id, required this.url});

  //refactoring==named constructor 
  BannarModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'];
    url = data['url'];
  }

  //method to map

  Map<String,dynamic>toMap(){
     return {
'id':id,'url':url,




     }

  }


   
}
