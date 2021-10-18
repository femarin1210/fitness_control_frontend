//import 'package:fitness_control/models/login/user.model.dart';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitness_control/models/workoutsequence/workoutSequence.model.dart';

class WorkoutSequenceRepository{

  Uri url;

  Future<bool> createWorkoutSequence(WorkoutSequenceModel model) async{

    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/workoutsequence');
print("ANTES POST");
print(model.toJson());

    //var workoutsequence = WorkoutSequenceModel();

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
      //var workoutsequence = WorkoutSequenceModel();
      //workoutsequence.title = null;
      return false;
   }

  }

  Future<bool> updateWorkoutSequence(WorkoutSequenceModel model, int id) async{

    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/workoutsequence/' + id.toString());
print("ANTES POST");
print(model.toJson());

    //var workoutsequence = WorkoutSequenceModel();

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
      //var workoutsequence = WorkoutSequenceModel();
      //workoutsequence.title = null;
      return false;
   }

  }


  Future<bool> deleteWorkoutSequence(int id) async{

    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/workoutsequence/' + id.toString());

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
      //var workoutsequence = WorkoutSequenceModel();
      //workoutsequence.title = null;
      return false;
   }

  }


  Future<List<WorkoutSequenceModel>> getWorkoutSequences(int userId) async{

    url = Uri.parse('https://fitnesscontrol.herokuapp.com/api/workoutsequences/' + userId.toString());

    List<WorkoutSequenceModel> workoutsequence = [];

    try{
      print("AAAAAAAAAAAAAAA");
      final response = await Dio().get(this.url.toString(),
                                    );
                                          print(response.statusCode);

      List res = response.data['data'];

      List<WorkoutSequenceModel> lista =
      res.isNotEmpty ? res.map(
        (a) => WorkoutSequenceModel.fromMap(a)).toList() : [];

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