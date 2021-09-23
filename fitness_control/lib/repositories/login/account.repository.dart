import 'package:fitness_control/models/login/user.model.dart';
import 'package:dio/dio.dart';
import 'package:fitness_control/view-models/login/login.viewmodel.dart';

class AccountRepository{

  Uri url;

  Future<UserModel> createAccount(LoginViewModel model) async{

    url = Uri.parse('http://192.168.0.114/PDS_NEW/backend/fitness_control/public/api/user');

    Response response = await Dio().post(this.url.toString(),
                                         data: model.toJson(),
                                         options: Options(headers: {"Accept": "application/json"}));

    var user = UserModel.fromJson(response.data);

    return user;

  }

  Future<UserModel> updateAccount(LoginViewModel model) async{

    url = Uri.parse('http://192.168.0.114/PDS_NEW/backend/fitness_control/public/api/user/' + model.id.toString());

    Response response = await Dio().post(this.url.toString(),
                                         data: model.toJson(),
                                         options: Options(headers: {"Accept": "application/json"}));

print(response.data);
    var user = UserModel.fromJson(response.data['data']);
print(user.toJson());

    return user;

  }

  Future<UserModel> getAccount(LoginViewModel model) async{

    url = Uri.parse('http://192.168.0.114/PDS_NEW/backend/fitness_control/public/api/login');

    Map<String, String> _headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };

    var user = UserModel();

    try{
      Response response = await Dio().post(this.url.toString(),
                                      data: model.toJson(),
                                      options: Options(headers: _headers));

      print(response.data);
      user = UserModel.fromJson(response.data['user']);
      print(response.data);
      print("AAAAAAAAAAAAAAA");
      user.accessToken = response.data['accessToken'];

    }catch(e){
      print(e);
      print("BBBBBBBBBBBBBB");
      user = UserModel();
      //user.accessToken = null;
      user.accessToken = "token_fake";      
    }

    return user;

  }

}