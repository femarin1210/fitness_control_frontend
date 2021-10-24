import 'package:fitness_control/controllers/workout/workout.controller.dart';
import 'package:fitness_control/controllers/workout/workoutSequence.controller.dart';
import 'package:fitness_control/models/workoutsequence/workoutSequence.model.dart';
import 'package:fitness_control/stores/app.store.dart';
import 'package:fitness_control/views/home/home.view.dart';
import 'package:fitness_control/views/workout/workoutSequenceExerciseList.view.dart';
import 'package:fitness_control/views/workout/workoutHome.view.dart';
import 'package:fitness_control/views/diet/diet.view.dart';
import 'package:fitness_control/views/workout/workoutSequenceList.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class WorkoutSequenceView extends StatefulWidget {

  final int idWorkoutSequence;
  final int idWorkout;
  final String titleWorkout;
  final WorkoutSequenceModel workoutSequenceUpdate;
  WorkoutSequenceView({this.idWorkoutSequence, this.idWorkout, this.workoutSequenceUpdate, this.titleWorkout});

  @override
  _WorkoutSequenceView createState() => _WorkoutSequenceView();
}

class _WorkoutSequenceView extends State<WorkoutSequenceView> {

  final _formKey = GlobalKey<FormState>();
  final _controller = WorkoutController();
  var workoutSequence = WorkoutSequenceModel();
  var _workoutSequence = WorkoutSequenceModel();
  
  bool isTrue;

  bool editado = false;
  WorkoutSequenceModel _editWorkoutSequence;

  final _titleController = TextEditingController();
  final _workoutController = TextEditingController();

  @override
  void initState(){
    super.initState();

    if (widget.workoutSequenceUpdate == null){
      _editWorkoutSequence = WorkoutSequenceModel(); 
    }else{
      _editWorkoutSequence = WorkoutSequenceModel.fromMap(widget.workoutSequenceUpdate.toMap());

      _titleController.text = _editWorkoutSequence.title;
      _workoutController.text = _editWorkoutSequence.workout;
      /*_weightController.text = _editWorkout.weight.toString(); 
      _fatPercentageController.text = _editWorkout.fatPercentage.toString();
      _chestController.text = _editWorkout.chest.toString();
      _bicepsController.text = _editWorkout.biceps.toString();
      _waistController.text = _editWorkout.waist.toString();
      _hipController.text = _editWorkout.hip.toString();
      _thighController.text = _editWorkout.thigh.toString();
      _calfController.text = _editWorkout.calf.toString();
      */

    }
  }

  @override
  Widget build(BuildContext context) {

    var store = Provider.of<AppStore>(context);

    return Scaffold(
      //backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text("Treinos"),
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
                      _mensagemConfirma(
                        context, 
                        "Atenção!",
                        "Ao voltar para página inicial, o cadastro corrente será perdido! Deseja voltar para página inicial?"),                  
                  ),
            ),
          ],
      ),
      body: 
      Container(
        padding: EdgeInsets.only(top:20, left: 16, right: 16, bottom: 16),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Projeto: " + widget.titleWorkout,
                            style: TextStyle(fontSize: 18,
                                            color: Colors.black87,)
                          ),
            SizedBox(height: 18,),
            Expanded(
              child: 
            Form(
            key: _formKey,
            child:Column(children: <Widget>[
              TextFormField(
                controller: _titleController,
  //            initialValue: "fernando@gmail.com",
              // autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Sequência",
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
                  return 'Informe a sequência';
                }
                return null;
              },
              onSaved: (val) => setState(() => _workoutSequence.title = val),
            ),
            SizedBox(
              height: 8,
            ),
            Text("Exemplos: Segunda-feira, Dia 1, Treino 1, Sequência 1"),
            SizedBox(
              height: 18,
            ),
              TextFormField(
                controller: _workoutController,
  //            initialValue: "fernando@gmail.com",
              // autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Treino",
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
                  return 'Informe o treino';
                }
                return null;
              },
              onSaved: (val) => setState(() => _workoutSequence.workout = val),
            ),
            SizedBox(
              height: 8,
            ),
            Text("Exemplos: Peito e Triceps, Costas e Biceps, Ombro, etc"),
            
            ],
              
            ),),
            ),
            SizedBox(height: 20,),
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
                        "Salvar",
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

                        _workoutSequence.id = 0;
                        _workoutSequence.idUser = store.id;
                        _workoutSequence.sequence = 1;
                        _workoutSequence.status = "A";
                        _workoutSequence.idWorkout = widget.idWorkout;

                        if (widget.idWorkoutSequence == null) {
                          insertWorkoutSequence();
                        }else{
                          updateWorkoutSequence();
                        }
                    }  
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  void _mensagemConfirma(BuildContext context, String titulo, String mensagem){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(titulo,
                    textAlign: TextAlign.center),
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
              child: Text("Confirmar"),
              onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeView()),
                    );
              }, 
            ),
          ],
        );
      }
    );
  }

  insertWorkoutSequence() async{

    //var store = Provider.of<AppStore>(context, listen: false);

    setState(() {});
    await WorkoutSequenceController().create(_workoutSequence).then((data){
      setState(() { 
        isTrue = data;  
                    print(workoutSequence.toJson());   
      });
    });

    if (isTrue) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => WorkoutSequenceListView(idWorkout: widget.idWorkout, titleWorkout: widget.titleWorkout),
        ),
      );
    }
  } 

  updateWorkoutSequence() async{

    //var store = Provider.of<AppStore>(context, listen: false);

    setState(() {});
    await WorkoutSequenceController().update(_workoutSequence, _editWorkoutSequence.id).then((data){
      setState(() { 
        isTrue = data;  
                    print(workoutSequence.toJson());   
      });
    });

    if (isTrue) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => WorkoutSequenceListView(idWorkout: widget.idWorkout, titleWorkout: widget.titleWorkout),
        ),
      );
    }

  } 

}

