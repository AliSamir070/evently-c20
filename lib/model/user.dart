class User {
  String? id;
  String? name;
  String? email;
  List<String>? favorites;
  User({this.name,this.email,this.id,this.favorites});

  User.fromFireStore(Map<String,dynamic>? data){
    id = data?["id"];
    name = data?["name"];
    email = data?["email"];
    favorites = List<String>.from(data?["favoriteList"]);
  }

  Map<String,dynamic> toFireStore(){
    return {
      "id":id,
      "name":name,
      "email":email,
      "favoriteList":favorites
    };
  }
}