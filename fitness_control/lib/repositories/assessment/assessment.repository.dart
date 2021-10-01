//import 'package:fitness_control/models/login/user.model.dart';
import 'package:dio/dio.dart';
import 'package:fitness_control/models/assessment/assessment.model.dart';

class AssessmentRepository{

  Uri url;

  Future<AssessmentModel> createAssessment(AssessmentModel model) async{

    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/assessment');
print("ANTES POST");
print(model.toJson());
    Response response = await Dio().post(this.url.toString(),
                                         data: model.toJson(),
                                         options: Options(headers: {"Accept": "application/json"}));
print("DEPOIS POST");
    var assessment = AssessmentModel.fromJson(response.data);
print("DEPOIS POST111");
    return assessment;

  }

/*
  Future<UserModel> updateAssessment(LoginViewModel model) async{

    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/user/' + model.id.toString());

    Response response = await Dio().post(this.url.toString(),
                                         data: model.toJson(),
                                         options: Options(headers: {"Accept": "application/json"}));

print(response.data);
    var user = UserModel.fromJson(response.data['data']);
print(user.toJson());

    return user;

  }

  Future<UserModel> getAssessment(LoginViewModel model) async{

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
*/

}