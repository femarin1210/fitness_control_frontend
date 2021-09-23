import 'dart:async';

import 'package:fitness_control/controllers/login/login.controller.dart';
import 'package:fitness_control/controllers/login/signup.controller.dart';
import 'package:fitness_control/models/login/user.model.dart';
import 'package:fitness_control/stores/app.store.dart';
import 'package:fitness_control/view-models/login/login.viewmodel.dart';
import 'package:fitness_control/views/login/reset_password.view.dart';
import 'package:fitness_control/views/login/signup.view.dart';
import 'package:fitness_control/views/home/home.view.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  void initState(){
    super.initState();
    isLoged().then((value) {
      print("value login");
      print(value);
      if(value){
        Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (context) => HomeView(),),);
      }
    });
  }

  var _user = LoginViewModel();
  UserModel user = UserModel();

  final Shader linearGradient = 
    LinearGradient(
      colors: <Color>[Color(0xFF0000FF), Color(0XFF6495ED)],
    ).createShader(Rect.fromLTWH(0.0, 1.0, 200.0, 70.0));

  final _formKey = GlobalKey<FormState>();

  final _controller = SignupController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      extendBody: true,
//      backgroundColor: kPrimaryColor,
      body:
      Container(
        alignment: Alignment.center,

//        height: 300,
        //alignment: Alignment.center,
//        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 14, right: 14, top: 20, bottom: 10),
          child:
        Form(
            key: _formKey,
        //    child:
        //Card(
        //margin: EdgeInsets.only(left:25, right: 25, top: 18),
        //elevation: 6,
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
            children: <Widget>[
            Container(
              height: 100,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Icon(Icons.fitness_center,
                       color: Colors.grey,
                       size: 46),
                  SizedBox(width: 18),
                  Icon(Icons.restaurant,
                       color: Colors.grey,
                       size: 46),
                  SizedBox(width: 18),
                  Icon(Icons.directions_run,
                       color: Colors.grey,
                       size: 46),
                  Icon(Icons.delete_outline,
                       color: Colors.grey,
                       size: 46),
//                  SizedBox(
//                    width: 46,
//                    height: 46,
//                    child: Image.asset("assets/supplement.png"),
//                  ),
                ],
              ),
            ),
            Container(
              height: 42,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Text('Fitness Control',
                      style: new TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: "fernando@gmail.com",
              // autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o e-mail';
                }
                return null;
              },
              onSaved: (val) => setState(() => _user.email = val),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              initialValue: "secret",
              // autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe a senha';
                }
                return null;
              },
              onSaved: (val) => setState(() => _user.password = val),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Recuperar Senha",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordView(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _user.busy 
            ? Center(
              child: Container(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black38,
                ),
              ),
            )
            :
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0XFF6495ED),
                    Color(0xFF0000FF),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Icon(Icons.fitness_center,
                                      size: 32,
                                      color: Colors.white),
                          height: 28,
                          width: 28,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    if(_formKey.currentState.validate()){
                      _formKey.currentState.save();

                        //AccountRepository().getAccount(_user);
                        getLogin();

                    //setState(() {});
                    //  _controller.create(model).then((data){                                  
                    //    setState(() {});

                  //}); 
                  }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
/*            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color(0xFF3C5A99),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Login com Facebook",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/fb-icon.png"),
                          height: 28,
                          width: 28,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ), */
            //SizedBox(
            //  height: 10,
            //),
            Container(
              height: 40,
              child: FlatButton(
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupView(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        ),
        //),
        ),
      ),
      ),
    );
  }

  Future<bool> getLogin() async{

    var store = Provider.of<AppStore>(context, listen: false);

    //SharedPreferences.setMockInitialValues({});
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {});
    await LoginController().login(_user).then((data){
      //print(_login);
      setState(() { 
        user = data;     
      });
    });
    setState(() {});

print("CCCCCCCCCC");
print(user.toJson());

    if (user.accessToken != null) {
      await sharedPreferences.setString('token', user.accessToken);
      print('tokem shared');
      print(sharedPreferences.getString('token'));
      store.setUser(user.id, user.name, user.email, user.password, "", user.typeUser, user.accessToken);
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
      );
      return true;
    }else{
      Flushbar(
        message: "DADOS DE LOGIN INVÁLIDOS!",
        icon: Icon(
          Icons.error,
          size: 28.0,
          color: Colors.red[300],
          ),
        duration: Duration(seconds: 5),
        leftBarIndicatorColor: Colors.red[300],
      )..show(context);
      return false;
    }
    
  }

  Future<bool> isLoged() async{
//    SharedPreferences.setMockInitialValues({});
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString('token') != null){
      return true;
    }else{
      print(sharedPreferences.getString('token'));
      return false;
    }
  }

}