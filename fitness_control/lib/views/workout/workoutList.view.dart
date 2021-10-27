import 'dart:async';

import 'package:fitness_control/models/workout/workout.model.dart';
import 'package:fitness_control/repositories/workout/workout.repository.dart';
import 'package:fitness_control/stores/app.store.dart';
import 'package:fitness_control/views/diet/diet.view.dart';
import 'package:fitness_control/views/home/home.view.dart';
import 'package:fitness_control/views/workout/workout.view.dart';
import 'package:fitness_control/views/workout/workoutHome.view.dart';
import 'package:fitness_control/views/workout/workoutSequenceList.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WorkoutListView extends StatefulWidget {

  @override
  _WorkoutListView createState() => _WorkoutListView();
}

class _WorkoutListView extends State<WorkoutListView> {

  WorkoutRepository workoutRepository = WorkoutRepository();
  List<WorkoutModel> workouts = List<WorkoutModel>();
  bool isDelete;

  var _workout = WorkoutModel();

  @override
  void initState(){
    super.initState();

    _showWorkouts();

  }

  void _showWorkouts() async {

    setState(() {
      _workout.busy = true;
    });

//await Future.delayed(Duration(seconds: 3), () {});

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await workoutRepository.getWorkouts(sharedPreferences.getInt('id')).then((lista){
      setState(() {
        workouts = lista;
      });
    });

    setState(() {
      _workout.busy = false;
    });
  
  }

  void _updateWorkout({WorkoutModel workoutUpdate}) async{
    final workoutRecive = await Navigator.push(context, 
                   MaterialPageRoute(builder: (context)=> WorkoutView(workoutUpdate:workoutUpdate)
                   ),
    );
  }

  void _deleteWorkout(int id, int index) async {
    await workoutRepository.deleteWorkout(id).then((lista){
      setState(() {
        isDelete = lista;
        if (isDelete){
          workouts.removeAt(index);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text("Projetos"),
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
          actions: [
            Builder(
              builder: (context) => IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () =>   

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeView()),
                    ),

                  ),
            ),
          ],
      ),
      body:
      _workout.busy 
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
                    child: Icon(Icons.fitness_center,
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
                itemCount: workouts.length,
                itemBuilder: (context,index) {
                  return _listWorkouts(context, index);
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
                        "Cadastrar novo Projeto",
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
//                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => WorkoutView()),
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

  _listWorkouts(BuildContext context, int index){

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
                    Text(workouts[index].title,
                    style: TextStyle(fontSize: 18),),
                    SizedBox(height: 2,),
                    Text("Data Início: " + workouts[index].dateStart,
                    style: TextStyle(fontSize: 16),),
                    SizedBox(height: 2,),
                    Text("Data Final: " + workouts[index].dateFinal,
                    style: TextStyle(fontSize: 16),),

                  ],
                ),
              ),
              menuActions(context, workouts[index].id, index),
/*              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                       SizedBox(width: 10,),
                       GestureDetector(child:Icon(Icons.more_vert,
                        color: Colors.black,),
              onTap: (){



                //_mensagemConfirma(context, 
                //                  workouts[index].id, 
                //                  index, 
                //                  "Exclusão!",
                //                  "Confirma exclusão do registro?\n\n" + workouts[index].title);
              },
                        ),
//                      onPressed: () {
//                      },
//                    ),
                  ], 
                ),
              ), */
            ],
          ),
      ),
    ),
              onHorizontalDragUpdate: (e) =>
              
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkoutSequenceListView(idWorkout: workouts[index].id, titleWorkout: workouts[index].title)),
                ),
    );
  }

  void _mensagemConfirma(BuildContext context, int workoutid, int index, String titulo, String mensagem){
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
                  _deleteWorkout(workoutid, index);
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

            if (_value == "treinos"){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkoutSequenceListView(idWorkout: workouts[index].id, titleWorkout: workouts[index].title)),
                );

            }

            if (_value == "excluir"){
                _mensagemConfirma(context, 
                                  workouts[index].id, 
                                  index, 
                                  "Exclusão!",
                                  "Confirma exclusão do registro?\n\n" + workouts[index].title);              
            }

            if (_value == "editar"){

              _updateWorkout(workoutUpdate: workouts[index]);    

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
        ), */
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
        ),
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

