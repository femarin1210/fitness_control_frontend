//import 'package:fitness_control/models/login/user.model.dart';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitness_control/models/assessment/assessment.model.dart';

class AssessmentRepository{

  Uri url;

  Future<bool> createAssessment(AssessmentModel model) async{

    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/assessment');
print("ANTES POST");
print(model.toJson());

    //var assessment = AssessmentModel();

    try{

      Response response = await Dio().post(this.url.toString(),
                                          data: model.toJson(),
                                          options: Options(headers: {"Accept": "application/json"}));
      print("DEPOIS POST");
      print(response.data);    
      print("DEPOIS POST111");
      return true;

   } on DioError catch(e){

      print(e);
      print("BBBBBBBBBBBBBB");
      //var assessment = AssessmentModel();
      //assessment.title = null;
      return false;
   }

  }

  Future<bool> updateAssessment(AssessmentModel model, int id) async{

    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/assessment/' + id.toString());
print("ANTES POST");
print(model.toJson());

    //var assessment = AssessmentModel();

    try{

      Response response = await Dio().post(this.url.toString(),
                                          data: model.toJson(),
                                          options: Options(headers: {"Accept": "application/json"}));
      print("DEPOIS POST");
      print(response.data);    
      print("DEPOIS POST111");
      return true;

   } on DioError catch(e){

      print(e);
      print("BBBBBBBBBBBBBB");
      //var assessment = AssessmentModel();
      //assessment.title = null;
      return false;
   }

  }


  Future<bool> deleteAssessment(int id) async{

    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/assessment/' + id.toString());

    try{

      Response response = await Dio().delete(this.url.toString(),
                                          options: Options(headers: {"Accept": "application/json"}));
      print("DEPOIS POST");
      print(response.data);    
      print("DEPOIS POST111");
      return true;

   } on DioError catch(e){

      print(e);
      print("BBBBBBBBBBBBBB");
      //var assessment = AssessmentModel();
      //assessment.title = null;
      return false;
   }

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
*/

  Future<List<AssessmentModel>> getAssessments(int userId) async{

    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/assessments');

    List<AssessmentModel> assessment = [];

    try{
      print("AAAAAAAAAAAAAAA");
      final response = await Dio().get(this.url.toString(),
                                    );
                                          print(response.statusCode);

      List res = response.data['data'];

      List<AssessmentModel> lista =
      res.isNotEmpty ? res.map(
        (a) => AssessmentModel.fromMap(a)).toList() : [];

      return lista;

    } on DioError catch(e){
      print(e);
      print("BBBBBBBBBBBBBB");
      return null;
      //user = UserModel();
      //user.accessToken = null;
      //user.accessToken = "token_fake";      
    }

    

  }


}