//import 'package:fitness_control/models/login/user.model.dart';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitness_control/models/workout/workout.model.dart';

class WorkoutRepository{

  Uri url;

  Future<bool> createWorkout(WorkoutModel model) async{

    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/workout');
print("ANTES POST");
print(model.toJson());

    //var workout = WorkoutModel();

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
      //var workout = WorkoutModel();
      //workout.title = null;
      return false;
   }

  }

  Future<bool> updateWorkout(WorkoutModel model, int id) async{

    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/workout/' + id.toString());
print("ANTES POST");
print(model.toJson());

    //var workout = WorkoutModel();

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
      //var workout = WorkoutModel();
      //workout.title = null;
      return false;
   }

  }


  Future<bool> deleteWorkout(int id) async{

    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/workout/' + id.toString());

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
      //var workout = WorkoutModel();
      //workout.title = null;
      return false;
   }

  }


  Future<List<WorkoutModel>> getWorkouts(int userId) async{

    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/workouts/' + userId.toString());

    List<WorkoutModel> workout = [];

    try{
      print("AAAAAAAAAAAAAAA");
      final response = await Dio().get(this.url.toString(),
                                    );
                                          print(response.statusCode);

      List res = response.data['data'];

      List<WorkoutModel> lista =
      res.isNotEmpty ? res.map(
        (a) => WorkoutModel.fromMap(a)).toList() : [];

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