class UserDetailsModels{
  String? displayName;
  String? email;
  String? photoURL;

  UserDetailsModels({this.displayName, this.email, this.photoURL});

  UserDetailsModels.fromJson(Map<String, dynamic> json){
    displayName = json["displayName"];
    email = json["email"];
    photoURL = json["photoURL"];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> mapData = new Map<String, dynamic> ();
    mapData["displayName"] = this.displayName;
    mapData["email"] = this.email;
    mapData["photoURL"] = this.photoURL;

    return mapData;
  }

}