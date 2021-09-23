class LoginViewModel {
  int id = 0;
  String name = "";
  String email="";
  String password="";
  String typeUser="";
  String accessToken="";
  bool busy = false;

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

