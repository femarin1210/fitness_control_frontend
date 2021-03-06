import 'dart:async';

import 'package:fitness_control/models/assessment/assessment.model.dart';
import 'package:fitness_control/repositories/assessment/assessment.repository.dart';
import 'package:fitness_control/stores/app.store.dart';
import 'package:fitness_control/views/diet/diet.view.dart';
import 'package:fitness_control/views/assessment/assessment.crud1.view.dart';
import 'package:fitness_control/views/assessment/assessment.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AssessmentCrudView extends StatefulWidget {

  @override
  _AssessmentCrudView createState() => _AssessmentCrudView();
}

class _AssessmentCrudView extends State<AssessmentCrudView> {

  AssessmentRepository assessmentRepository = AssessmentRepository();
  List<AssessmentModel> assessments = List<AssessmentModel>();
  bool isDelete;

  var _assessment = AssessmentModel();

  @override
  void initState(){
    super.initState();
   
    _showAssessments();

  }

  void _showAssessments() async {

    setState(() {
      _assessment.busy = true;
    });

//await Future.delayed(Duration(seconds: 3), () {});

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await assessmentRepository.getAssessments(sharedPreferences.getInt('id')).then((lista){
      setState(() {
        assessments = lista;
      });
    });

    setState(() {
      _assessment.busy = false;
    });
  
  }

  void _deleteAssessment(int id, int index) async {
    await assessmentRepository.deleteAssessment(id).then((lista){
      setState(() {
        isDelete = lista;
        if (isDelete){
          assessments.removeAt(index);
        }
      });
    });
  }

  void _updateAssessment({AssessmentModel assessmentUpdate, String typeAssessment}) async{
    final assessmentRecive = await Navigator.push(context, 
                   MaterialPageRoute(builder: (context)=> AssessmentCrud1View(assessmentUpdate:assessmentUpdate,
                                                                              typeAssessment: typeAssessment)
                   ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text("Avalia????es/Metas"),
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
      body:
      _assessment.busy 
            ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //Text('Loading...',
                  //style: TextStyle(fontSize: 16,
                  //  color: Colors.black54),),
                  //SizedBox(height: 6),
                  GlowingProgressIndicator(
                    child: Icon(Icons.assignment,
                      size: 50,
                      color: Colors.black54),
                  ),
                ],
              ),
            )
            :
      Container(
        padding: EdgeInsets.only(top:20, left: 16, right: 16, bottom: 16),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child:ListView.builder(
                scrollDirection: Axis.vertical,
                //padding: EdgeInsets.all(0.0),
                itemCount: assessments.length,
                itemBuilder: (context,index) {
                  return _listAssessments(context, index);
                },
              ),
            ),
            //SizedBox(height: 20,),
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
                        "Cadastrar nova Meta",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Icon(Icons.outlined_flag,
                                      size: 32,
                                      color: Colors.white),
                          height: 28,
                          width: 28,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AssessmentCrud1View(typeAssessment: 'M')),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10,),
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
                        "Cadastrar nova Avalia????o",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Icon(Icons.assignment,
                                      size: 32,
                                      color: Colors.white),
                          height: 28,
                          width: 28,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AssessmentCrud1View(typeAssessment: 'A')),
                    );
                  },
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  _listAssessments(BuildContext context, int index){

    return GestureDetector(
    child:
    Card(
      elevation: 6,
      child: Padding(
        padding: EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(assessments[index].title,
                    style: TextStyle(fontSize: 18),),
                    SizedBox(height: 2,),
                    Text("Data: " + assessments[index].date,
                    style: TextStyle(fontSize: 16),),
                    SizedBox(height: 2,),
                    Text("Peso: " + assessments[index].weight.toString() + " Kg      Gordura: " + assessments[index].fatPercentage.toString() + "%",
                    style: TextStyle(fontSize: 16),),

                  ],
                ),
              ),
              menuActions(context, assessments[index].id, index),
/*              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                      if (index == 1) 
                        GestureDetector(child: 
                          Icon(Icons.check_circle, color: Colors.green,),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DietView()),
                );},                           
                        ),
                        SizedBox(width: 10,),
                        
                        GestureDetector(child: Icon(Icons.edit,
                        color: Colors.blue,),
              onTap: (){
                   _updateAssessment(assessmentUpdate: assessments[index]);
                },                        
                        ),
                    
//                    FlatButton(
                       SizedBox(width: 10,),
                       GestureDetector(child:Icon(Icons.delete,
                        color: Colors.red,),
              onTap: (){
                _mensagemConfirma(context, 
                                  assessments[index].id, 
                                  index, 
                                  "Exclus??o!",
                                  "Confirma exclus??o do registro?\n\n" + assessments[index].title);
              },
                        ),
//                      onPressed: () {
//                      },
//                    ),
                  ], 
                ),
              ),*/
            ],
          ),
      ),
    ),
                  onHorizontalDragUpdate: (e) =>      
 _updateAssessment(assessmentUpdate: assessments[index], typeAssessment: assessments[index].type),                         
    );
  }

  void _mensagemConfirma(BuildContext context, int assessmentid, index, String titulo, String mensagem){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(titulo),
          content: Text(mensagem,
                      textAlign: TextAlign.center),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: (){
                Navigator.of(context).pop();
              }, 
            ),
            FlatButton(
              child: Text("Excluir"),
              onPressed: (){
                setState(() {
                  _deleteAssessment(assessmentid, index);
                });
                Navigator.of(context).pop();
              }, 
            ),
          ],
        );
      }
    );
  }

  Widget menuActions(BuildContext context, int idWorkout, int index){

    String _value = "";

    return Container(child:
      PopupMenuButton(
        icon: Icon(Icons.more_vert, size: 38, color: Colors.black54,),
        onSelected: (value) {
          setState(() {
            _value = value;
            print(_value);

            if (_value == "excluir"){
                _mensagemConfirma(context, 
                                  assessments[index].id, 
                                  index, 
                                  "Exclus??o!",
                                  "Confirma exclus??o do registro?\n\n" + assessments[index].title);              
            }

            if (_value == "editar"){

              _updateAssessment(assessmentUpdate: assessments[index], typeAssessment: assessments[index].type);

            }

          });
        },
        color: Colors.black87,
        itemBuilder: (context) => 
        [
/*          PopupMenuItem(
          value: "id",
          child: Row(
            children: [
              Text(idWorkout.toString(),style: TextStyle(color: Colors.white),),
            ],
          ),
        ), 
          PopupMenuItem(
            value: "treinos",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Treinos",
              style: TextStyle(color: Colors.white),),
              Icon(Icons.fitness_center, color: Colors.white, size: 18,),
            ],
          ),
        ),*/
        PopupMenuItem(
            value: "editar",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Editar",
              style: TextStyle(color: Colors.white),),
              Icon(Icons.edit, color: Colors.white, size: 18,),
            ],
          ),
        ),
        PopupMenuItem(
            value: "excluir",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Excluir",
              style: TextStyle(color: Colors.white),),
              Icon(Icons.delete, color: Colors.white, size: 18,),
            ],
          ),
        ),
        
        ],

      ),);
  }  

}

