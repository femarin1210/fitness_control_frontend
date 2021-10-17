import 'package:fitness_control/controllers/login/login.controller.dart';
import 'package:fitness_control/controllers/login/signup.controller.dart';
import 'package:fitness_control/models/login/user.model.dart';
import 'package:fitness_control/repositories/login/account.repository.dart';
import 'package:fitness_control/stores/app.store.dart';
import 'package:fitness_control/view-models/login/login.viewmodel.dart';
import 'package:fitness_control/views/home/home.view.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

  final Shader linearGradient = 
    LinearGradient(
      colors: <Color>[Color(0xFF0000FF), Color(0XFF6495ED)],
    ).createShader(Rect.fromLTWH(0.0, 1.0, 200.0, 70.0));

  final _formKey = GlobalKey<FormState>();
  final _controller = SignupController();
  var _user = LoginViewModel();
  var user = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
          child:
          Form(
            key: _formKey,
            child:
        Container(
        //margin: EdgeInsets.only(left:25, right: 25, top: 18),
        
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
              height: 10,
            ),
            TextFormField(
              // autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  //fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o nome';
                }
                return null;
              },
              onSaved: (val) => setState(() => _user.name = val),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              // autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o e-mail';
                }
                return null;
              },
              onSaved: (val) => setState(() => _user.email = val),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
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
                border: OutlineInputBorder(),
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
            SizedBox(
              height: 30,
            ),
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
                        "Cadastrar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Icon(Icons.check,
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

                        _user.typeUser = "U";

                    //setState(() {});
                    //  _controller.create(model).then((data){                                  
                    //    setState(() {});
                        
                          getLogin();
                  //}); 
                  }
 //                   Navigator.push(
 //                     context,
 //                     MaterialPageRoute(
//                      builder: (context) => HomeView(),
//                      ),
//                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: FlatButton(
                child: Text(
                  "Cancelar",
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.pop(context, false),
              ),
            ),
          ],
        ),
      ),
        ),
        ),
        ),
      ),
    );
  }

  getLogin() async{

    var store = Provider.of<AppStore>(context, listen: false);

    setState(() {});
    await SignupController().create(_user).then((data){
      setState(() { 
        user = data;     
      });
    });
print("CCCCCCCCCC");
print(user.toJson());
    setState(() {});

    if (user.accessToken != null) {
      store.setUser(user.id, user.name, user.email, user.password, "", user.typeUser, user.accessToken);
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
      );
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
    }
    
  }

}