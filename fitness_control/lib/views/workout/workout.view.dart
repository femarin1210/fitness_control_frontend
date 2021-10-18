import 'package:fitness_control/controllers/workout/workout.controller.dart';
import 'package:fitness_control/models/workout/workout.model.dart';
import 'package:fitness_control/stores/app.store.dart';
import 'package:fitness_control/views/workout/workoutHome.view.dart';
import 'package:fitness_control/views/diet/diet.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'workoutSequence.view.dart';

class WorkoutView extends StatefulWidget {

  final WorkoutModel workoutUpdate;
  WorkoutView({this.workoutUpdate});

  @override
  _WorkoutView createState() => _WorkoutView();
}

class _WorkoutView extends State<WorkoutView> {

  final _formKey = GlobalKey<FormState>();
  final _controller = WorkoutController();
  var workout = WorkoutModel();
  var _workout = WorkoutModel();
  bool isTrue;

  bool editado = false;
  WorkoutModel _editWorkout;

  final _titleController = TextEditingController();

  @override
  void initState(){
    super.initState();

    if (widget.workoutUpdate == null){
      _editWorkout = WorkoutModel(); 
    }else{
      _editWorkout = WorkoutModel.fromMap(widget.workoutUpdate.toMap());

      _titleController.text = _editWorkout.title;
      /*_heightController.text = _editWorkout.height.toString();
      _weightController.text = _editWorkout.weight.toString(); 
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
        title: Text(widget.workoutUpdate == null ? "Novo Treino" : "Editar Treino",),
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
      Container(
        padding: EdgeInsets.only(top:20, left: 16, right: 16, bottom: 16),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Form(
            key: _formKey,
            child:Column(children: <Widget>[
                          TextFormField(
  //            initialValue: "fernando@gmail.com",
              // autofocus: true,
              controller: _titleController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Título Projeto",
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
                  return 'Informe o título do projeto';
                }
                return null;
              },
              onSaved: (val) => setState(() => _workout.title = val),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Exemplos: Projeto Verão, Projeto 3 meses, Projeto Emagrecer, etc"),
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
                        "Próximo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Icon(Icons.play_arrow,
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


                        _workout.id = 0;
                        _workout.idUser = store.id;
                        _workout.dateStart = "2021-10-01";
                        _workout.dateFinal = "2021-12-31";
                        _workout.status = "A";
                        _workout.qtyWorkoutsWeek = 0;

                    //setState(() {});
                    //  _controller.create(model).then((data){                                  
                    //    setState(() {});
                        if (widget.workoutUpdate == null) {
                          insertWorkout();
                        }else{
                          updateWorkout();
                        }

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WorkoutSequenceView(idWorkout:15)),
                    );

                    //}); 
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

insertWorkout() async{

    //var store = Provider.of<AppStore>(context, listen: false);

    setState(() {});
    await WorkoutController().create(_workout).then((data){
      setState(() { 
        isTrue = data;  
                    print(workout.toJson());   
      });
    });

    if (isTrue) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => WorkoutSequenceView(),
        ),
      );
    }
  } 

  updateWorkout() async{

    //var store = Provider.of<AppStore>(context, listen: false);

    setState(() {});
    await WorkoutController().update(_workout, _editWorkout.id).then((data){
      setState(() { 
        isTrue = data;  
                    print(workout.toJson());   
      });
    });

    if (isTrue) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => WorkoutSequenceView(),
        ),
      );
    }

  } 

}

