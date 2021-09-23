import 'dart:io';

import 'package:fitness_control/controllers/login/signup.controller.dart';
import 'package:fitness_control/models/login/user.model.dart';
import 'package:fitness_control/repositories/login/account.repository.dart';
import 'package:fitness_control/stores/app.store.dart';
import 'package:fitness_control/view-models/login/login.viewmodel.dart';
import 'package:fitness_control/views/home/home.view.dart';
import 'package:fitness_control/views/login/alterPassword.view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {

  @override
  _ProfileView createState() => _ProfileView();
}

class _ProfileView extends State<ProfileView> {

  final Shader linearGradient = 
    LinearGradient(
      colors: <Color>[Color(0xFF0000FF), Color(0XFF6495ED)],
    ).createShader(Rect.fromLTWH(0.0, 1.0, 200.0, 70.0));

  final _formKey = GlobalKey<FormState>();
  final _controller = SignupController();
  var _user = LoginViewModel();

  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  
  @override
  Widget build(BuildContext context) {

    var store = Provider.of<AppStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Perfil"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0XFF6495ED),
                Color(0xFF0000FF),
              ],
            ),
          ),          
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
          child:
          Form(
            key: _formKey,
           // child:
        //Card(
        //margin: EdgeInsets.only(left:25, right: 25, top: 18),
        //elevation: 6,
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
            children: <Widget>[
            imageProfile(),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              initialValue: store.name,
              // autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  //fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
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
              height: 5,
            ),
            TextFormField(
              enabled: false,
              initialValue: store.email,
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
              height: 5,
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
                        "Alterar",
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

                        _user.id = store.id;
                        SignupController().update(_user, context);

                    //setState(() {});
                    //  _controller.create(model).then((data){                                  
                    //    setState(() {});
                        
                        Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => HomeView(),
                        ),
                      );
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
              child: FlatButton(
                child: Text(
                  "Alterar Senha",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AlterPasswordView(),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: FlatButton(
                child: Text(
                  "Cancelar",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
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
      //),
    );
  }

  Widget imageProfile(){

    var store = Provider.of<AppStore>(context, listen: false);

    return GestureDetector(child: 
      Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: store.picture == "" 
            ? AssetImage("assets/image_profile.jpg")
            : FileImage(File(store.picture)),
        ),
        Positioned(
          bottom: 0.0,
          right: 6.0,
          child: 
          InkWell(
            child:
            Icon(Icons.add_a_photo,
              color: Colors.black45,
              size: 28.0
            ),
          ),
        ),
      ],
    ),
            onTap: () {
              showModalBottomSheet(
                context: context, 
                builder: ((builder) => bottomSheet()),
              );
            },
    );
  }

  Widget bottomSheet(){
    return Container(
      color: Colors.white,
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0, 
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Escolha a foto do Perfil",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera_alt,
                  size: 30,),
                onPressed: (){
                  takePhoto(ImageSource.camera, context);
                },
                label: Text("Câmera",
                  style: TextStyle(fontSize: 18.0),),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image,
                  size: 30,),
                onPressed: (){
                  takePhoto(ImageSource.gallery, context);
                },
                label: Text("Galeria",
                  style: TextStyle(fontSize: 18.0),),
              )

            ],
          ),
        ],
      ), 
    );
  }

  void takePhoto(ImageSource source, context) async {
    var store = Provider.of<AppStore>(context, listen: false);
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
      store.setImage(_imageFile.path);
    });
  }

}