import 'package:fitness_control/models/workoutsequence/workoutSequence.model.dart';
import 'package:fitness_control/repositories/workout/workoutSequence.repository.dart';
import 'package:fitness_control/views/home/home.view.dart';
import 'package:fitness_control/views/workout/workoutHome.view.dart';
import 'package:fitness_control/views/diet/diet.view.dart';
import 'package:fitness_control/views/workout/workout.view.dart';
import 'package:fitness_control/views/workout/workoutSequence.view.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WorkoutSequenceExerciseListView extends StatefulWidget {

  final int idWorkoutSequence;
  final int idWorkout;
  final WorkoutSequenceModel workoutSequenceUpdate;
  WorkoutSequenceExerciseListView({this.idWorkoutSequence, this.idWorkout, this.workoutSequenceUpdate});

  @override
  _WorkoutSequenceExerciseListView createState() => _WorkoutSequenceExerciseListView();
}

class _WorkoutSequenceExerciseListView extends State<WorkoutSequenceExerciseListView> {

  WorkoutSequenceRepository workoutsequenceRepository = WorkoutSequenceRepository();
  List<WorkoutSequenceModel> workoutsSequences = List<WorkoutSequenceModel>();
  bool isDelete;

  var _workoutSequence = WorkoutSequenceModel();

  @override
  void initState(){
    super.initState();

    _showWorkoutsSequences();

  }

  void _showWorkoutsSequences() async {

    setState(() {
      _workoutSequence.busy = true;
    });

//await Future.delayed(Duration(seconds: 3), () {});

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await workoutsequenceRepository.getWorkoutSequences(sharedPreferences.getInt('id')).then((lista){
      setState(() {
        workoutsSequences = lista;
      });
    });

    setState(() {
      _workoutSequence.busy = false;
    });
  
  }

  void _updateWorkoutSequence({WorkoutSequenceModel workoutSequenceUpdate}) async{
    final workoutRecive = await Navigator.push(context, 
                   MaterialPageRoute(builder: (context)=> WorkoutSequenceView(workoutSequenceUpdate:workoutSequenceUpdate, 
                                                                              //idWorkout:widget.idWorkout,
                                                                              idWorkoutSequence: workoutSequenceUpdate.id)
                   ),
    );
  }

  void _deleteWorkoutSequence(int id, int index) async {
    await workoutsequenceRepository.deleteWorkoutSequence(id).then((lista){
      setState(() {
        isDelete = lista;
        if (isDelete){
          workoutsSequences.removeAt(index);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text("Exerc??cios"),
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
      _workoutSequence.busy 
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
            Text('Projeto: Projeto Ver??o',
                            style: TextStyle(fontSize: 18,
                                            color: Colors.black87,)
                          ),
            SizedBox(height: 10,),
            Expanded(
              child:ListView.builder(
                scrollDirection: Axis.vertical,
                //padding: EdgeInsets.all(0.0),
                itemCount: workoutsSequences.length,
                itemBuilder: (context,index) {
                  return _listWorkoutsSequences(context, index);
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
                        "Cadastrar novo Exerc??cio",
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
                    Navigator.pushReplacement
                    (
                      context,
                      MaterialPageRoute(builder: (context) => WorkoutSequenceView(idWorkoutSequence: null)), //idWorkout: widget.idWorkout)),
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

  _listWorkoutsSequences(BuildContext context, int index){

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
                    Text(workoutsSequences[index].title,
                    style: TextStyle(fontSize: 18),),
                    SizedBox(height: 2,),
                    Text("Treino: " + workoutsSequences[index].workout,
                    style: TextStyle(fontSize: 16),),
                    SizedBox(height: 2,),
                    Text("Sequ??ncia: " + workoutsSequences[index].sequence.toString(),
                    style: TextStyle(fontSize: 16),),

                  ],
                ),
              ),
              menuActions(context, workoutsSequences[index].id, index),
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
                //                  "Exclus??o!",
                //                  "Confirma exclus??o do registro?\n\n" + workouts[index].title);
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
//                  MaterialPageRoute(builder: (context) => WorkoutSequenceView(idWorkoutSequence: null, idWorkout: widget.idWorkout)),
                  MaterialPageRoute(builder: (context) => WorkoutSequenceExerciseListView()),
                  
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
                  _deleteWorkoutSequence(workoutid, index);
                });
                Navigator.of(context).pop();
              }, 
            ),
          ],
        );
      }
    );
  }

  Widget menuActions(BuildContext context, int idWorkoutSequence, int index){

    String _value = "";

    return Container(child:
      PopupMenuButton(
        icon: Icon(Icons.more_vert, size: 38, color: Colors.black54,),
        onSelected: (value) {
          setState(() {
            _value = value;
            print(_value);

            if (_value == "exercicios"){

                Navigator.push(
                  context,
//                  MaterialPageRoute(builder: (context) => WorkoutSequenceExerciseView(idWorkoutSequence: null, idWorkout: widget.idWorkout)),
                  MaterialPageRoute(builder: (context) => WorkoutSequenceExerciseListView()),
                );

            }

            if (_value == "excluir"){
                _mensagemConfirma(context, 
                                  workoutsSequences[index].id, 
                                  index, 
                                  "Exclus??o!",
                                  "Confirma exclus??o do registro?\n\n" + workoutsSequences[index].title);              
            }

            if (_value == "editar"){

              _updateWorkoutSequence(workoutSequenceUpdate: workoutsSequences[index]);    

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
            value: "exercicios",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Exerc??cios",
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

