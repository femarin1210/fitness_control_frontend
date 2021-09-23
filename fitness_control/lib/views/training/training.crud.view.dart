import 'package:fitness_control/views/aerobic/aerobic.view.dart';
import 'package:fitness_control/views/diet/diet.view.dart';
import 'package:fitness_control/views/training/training.crud1.view.dart';
import 'package:fitness_control/views/training/training.view.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TrainingCrudView extends StatefulWidget {

  @override
  _TrainingCrudView createState() => _TrainingCrudView();
}

class _TrainingCrudView extends State<TrainingCrudView> {

  @override
  Widget build(BuildContext context) {

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
      ),
      body: 
      Container(
        padding: EdgeInsets.only(top:20, left: 16, right: 16, bottom: 16),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child:ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(0.0),
                itemCount: 10,
                itemBuilder: (context,index) {
                  return _listExercicies(context, index);
                },
              ),
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
                        "Cadastrar novo Treino",
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TrainingCrud1View()),
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

  _listExercicies(BuildContext context, int index){

    return Card(
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
                    Text("Treino Agosto-Outrubro",
                    style: TextStyle(fontSize: 18),),
                    Text("Data Início: 01/08/2021",
                    style: TextStyle(fontSize: 16),),
                    Text("Data Fim: 31/10/2021",
                    style: TextStyle(fontSize: 16),),

                  ],
                ),
              ),
              Container(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrainingView()),
                );},                        
                        ),
                    
//                    FlatButton(
                       SizedBox(width: 10,),
                       GestureDetector(child:Icon(Icons.delete,
                        color: Colors.red,),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AerobicView()),
                );},
                        ),
//                      onPressed: () {
//                      },
//                    ),
                  ], 
                ),
              ),
            ],
          ),
      ),
    );
  }
}

