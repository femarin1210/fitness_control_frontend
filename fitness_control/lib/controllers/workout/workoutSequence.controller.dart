import 'package:fitness_control/models/workoutsequence/workoutSequence.model.dart';
import 'package:fitness_control/models/login/user.model.dart';
import 'package:fitness_control/repositories/workoutsequence/workoutSequence.repository.dart';
import 'package:fitness_control/repositories/login/account.repository.dart';
import 'package:fitness_control/stores/app.store.dart';
import 'package:fitness_control/view-models/login/login.viewmodel.dart';
import 'package:provider/provider.dart';

class WorkoutSequenceController{

  WorkoutSequenceRepository repository;

  WorkoutSequenceController(){
    repository = WorkoutSequenceRepository();
  }

  Future<bool> create(WorkoutSequenceModel model) async{
  print("CREATE workoutsequence");
    //model.busy = true;
    var workoutsequence = await repository.createWorkoutSequence(model);
    //model.busy = false;
    //print(workoutsequence.toJson());
    //var _workoutsequence = await repository.getWorkoutSequence(model);
    //return _workoutsequence;
        print("DEPOIS CREATE workoutsequence");
    return workoutsequence;
  }

  Future<bool> update(WorkoutSequenceModel model, int id) async{
  print("UPDATE workoutsequence");
    //model.busy = true;
    var workoutsequence = await repository.updateWorkoutSequence(model, id);
    //model.busy = false;
    //print(workoutsequence.toJson());
    //var _workoutsequence = await repository.getWorkoutSequence(model);
    //return _workoutsequence;
        print("DEPOIS UPDATE workoutsequence");
    return workoutsequence;
  }

}