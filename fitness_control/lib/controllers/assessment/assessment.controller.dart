import 'package:fitness_control/models/assessment/assessment.model.dart';
import 'package:fitness_control/models/login/user.model.dart';
import 'package:fitness_control/repositories/assessment/assessment.repository.dart';
import 'package:fitness_control/repositories/login/account.repository.dart';
import 'package:fitness_control/stores/app.store.dart';
import 'package:fitness_control/view-models/login/login.viewmodel.dart';
import 'package:provider/provider.dart';

class AssessmentController{

  AssessmentRepository repository;

  AssessmentController(){
    repository = AssessmentRepository();
  }

  Future<bool> create(AssessmentModel model) async{
  print("CREATE ASSESSMENT");
    //model.busy = true;
    var assessment = await repository.createAssessment(model);
    //model.busy = false;
    //print(assessment.toJson());
    //var _assessment = await repository.getAssessment(model);
    //return _assessment;
        print("DEPOIS CREATE ASSESSMENT");
    return assessment;
  }

/*
  Future<UserModel> update(LoginViewModel model, context) async{
    model.busy = true;
    var user = await repository.updateAccount(model);
    model.busy = false;
    var store = Provider.of<AppStore>(context, listen: false);
    store.name = user.name;
    return user;
   
  }
*/

}