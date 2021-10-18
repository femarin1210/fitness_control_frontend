import 'package:fitness_control/models/workout/workout.model.dart';
import 'package:fitness_control/models/login/user.model.dart';
import 'package:fitness_control/repositories/workout/workout.repository.dart';
import 'package:fitness_control/repositories/login/account.repository.dart';
import 'package:fitness_control/stores/app.store.dart';
import 'package:fitness_control/view-models/login/login.viewmodel.dart';
import 'package:provider/provider.dart';

class WorkoutController{

  WorkoutRepository repository;

  WorkoutController(){
    repository = WorkoutRepository();
  }

  Future<bool> create(WorkoutModel model) async{
  print("CREATE workout");
    //model.busy = true;
    var workout = await repository.createWorkout(model);
    //model.busy = false;
    //print(workout.toJson());
    //var _workout = await repository.getWorkout(model);
    //return _workout;
        print("DEPOIS CREATE workout");
    return workout;
  }

  Future<bool> update(WorkoutModel model, int id) async{
  print("UPDATE workout");
    //model.busy = true;
    var workout = await repository.updateWorkout(model, id);
    //model.busy = false;
    //print(workout.toJson());
    //var _workout = await repository.getWorkout(model);
    //return _workout;
        print("DEPOIS UPDATE workout");
    return workout;
  }

}