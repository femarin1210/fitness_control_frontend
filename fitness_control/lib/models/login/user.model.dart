class UserModel {
  int id;
  String name;
  String email;
  String password;
  String typeUser;
  String accessToken;
  
  UserModel(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.typeUser,
      this.accessToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    typeUser = json['typeUser'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['typeUser'] = this.typeUser;
    data['accessToken'] = this.accessToken;
    return data;
  }
}