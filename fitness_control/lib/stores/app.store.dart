import 'package:mobx/mobx.dart';
part 'app.store.g.dart';

class AppStore = _AppStore with _$AppStore; 

abstract class _AppStore with Store{

  @observable
  int id=0;
  
  @observable
  String name="";

  @observable
  String email="";

  @observable
  String password="";

  @observable
  String picture = "";

  @observable
  String typeUser="";

  @observable
  String accessToken="";

  @action
  void setUser(
    int pIdUser,
    String pName,
    String pEmail,
    String pPassword,
    String pPicture,
    String pTypeUser,
    String pToken
  ){
    id = pIdUser;
    name = pName;
    email = pEmail;
    password = pPassword;
    picture = pPicture;
    typeUser = pTypeUser;
    accessToken = pToken;
  }

  @action
  void setImage(
    String pPicture,
  ){
    picture = pPicture;
  }

}