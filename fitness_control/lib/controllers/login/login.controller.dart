import 'package:fitness_control/models/login/user.model.dart';
import 'package:fitness_control/repositories/login/account.repository.dart';
import 'package:fitness_control/view-models/login/login.viewmodel.dart';

class LoginController{
  AccountRepository repository;

  LoginController(){
    repository = AccountRepository();
  }

  Future<UserModel> login(LoginViewModel model) async{
    print(model.email);
    print(model.password);
    model.busy = true;
    var user = await repository.getAccount(model);
    model.busy = false;
    print(user.toJson());
    return user;
   
  }

}