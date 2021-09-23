import 'package:fitness_control/models/login/user.model.dart';
import 'package:fitness_control/repositories/login/account.repository.dart';
import 'package:fitness_control/stores/app.store.dart';
import 'package:fitness_control/view-models/login/login.viewmodel.dart';
import 'package:provider/provider.dart';

class SignupController{
  AccountRepository repository;

  SignupController(){
    repository = AccountRepository();
  }

  Future<UserModel> create(LoginViewModel model) async{
    model.busy = true;
    var user = await repository.createAccount(model);
    model.busy = false;
    print(user.toJson());
    var _user = await repository.getAccount(model);
    return _user;
   
  }

  Future<UserModel> update(LoginViewModel model, context) async{
    model.busy = true;
    var user = await repository.updateAccount(model);
    model.busy = false;
    var store = Provider.of<AppStore>(context, listen: false);
    store.name = user.name;
    return user;
   
  }

}