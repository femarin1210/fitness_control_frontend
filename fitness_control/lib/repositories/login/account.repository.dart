import 'package:fitness_control/models/login/user.model.dart';
import 'package:dio/dio.dart';
import 'package:fitness_control/view-models/login/login.viewmodel.dart';

class AccountRepository{

  Uri url;

  Future<UserModel> createAccount(LoginViewModel model) async{
print("ANTES POST");
print(model.toJson());
    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/user');

    Response response = await Dio().post(this.url.toString(),
                                         data: model.toJson(),
                                         options: Options(headers: {"Accept": "application/json"}));
print("DEPOIS POST");
    var user = UserModel.fromJson(response.data);

    return user;

  }

  Future<UserModel> updateAccount(LoginViewModel model) async{

    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/user/' + model.id.toString());

    Response response = await Dio().post(this.url.toString(),
                                         data: model.toJson(),
                                         options: Options(headers: {"Accept": "application/json"}));

print(response.data);
    var user = UserModel.fromJson(response.data['data']);
print(user.toJson());

    return user;

  }

  Future<UserModel> getAccount(LoginViewModel model) async{

    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/login');

    Map<String, String> _headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };

    var user = UserModel();

    try{
      print("AAAAAAAAAAAAAAA");
      Response response = await Dio().post(this.url.toString(),
                                      data: model.toJson(),
                                      options: Options(headers: _headers));
      print(response.statusCode);
      print("DEPOIS DIO");
      print(response.data);
      user = UserModel.fromJson(response.data['user']);
      print(response.data);
      print("AAAAAAAAAAAAAAA");
      user.accessToken = response.data['accessToken'];

    } on DioError catch(e){
      print(e);
      print("BBBBBBBBBBBBBB");
      user = UserModel();
      user.accessToken = null;
      //user.accessToken = "token_fake";      
    }

    return user;

  }

}