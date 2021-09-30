import 'package:fitness_control/views/aerobic/aerobic.crud.view.dart';
import 'package:fitness_control/views/assessment/assessment.crud.view.dart';
import 'package:fitness_control/views/assessment/assessment.view.dart';
import 'package:fitness_control/views/training/training.crud.view.dart';
import 'package:fitness_control/widgets/notifications.dart';
import 'package:flutter/material.dart';
import 'package:fitness_control/views/report/report.view.dart';
//import 'package:fitness_control/pages/assessment.dart';
//import 'package:fitness_control/pages/training.dart';
//import 'package:fitness_control/pages/diet.dart';
//import 'package:fitness_control/pages/aerobic.dart';

class TabOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.only(left: 8, right: 8),
      //margin: EdgeInsets.only(top: 18),
      height: 58,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child:
                Container(
//                width: 95,
                color: Color.fromRGBO(255, 255, 255, .2),
                //padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.assignment,
                        color: Colors.grey[600],
                        size: 30,),
                    Text('Avaliações',
                        style: TextStyle(color: Colors.grey[600],
                                          fontSize: 15,
//                                          fontWeight: FontWeight.bold,
                                ),
                    ),
                  ],
                ),
                ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AssessmentCrudView()),
                );
              },
            ),
            GestureDetector(
              child:  
                Container(
//                width: 95,
                color: Color.fromRGBO(255, 255, 255, .2),
                //padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.fitness_center,
                        color: Colors.grey[600],
                        size: 30,),
                    
                    Text('Treinos',
                        style: TextStyle(color: Colors.grey[600],
                                          fontSize: 15,
//                                          fontWeight: FontWeight.bold,
                                ),
                    ),
                  ],
                ),
                ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrainingCrudView()),
                );
              },
            ),
            GestureDetector(
            child:
              Container(
//              width: 95,
              color: Color.fromRGBO(255, 255, 255, .2),
              //padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.directions_run,
                      color: Colors.grey[600],
                      size: 30,),                 
                  Text('Aeróbicos',
                      style: TextStyle(color: Colors.grey[600],
                                        fontSize: 15,
//                                        fontWeight: FontWeight.bold,
                              ),
                  ),
                ],
              ),
              ),
            onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AerobicCrudView()),
                );
              },
            ),
            GestureDetector(
            child:
              Container(
//              width: 95,
              color: Color.fromRGBO(255, 255, 255, .2),
              //padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.import_contacts,
                      color: Colors.grey[600],
                      size: 30,),
//                  SizedBox(
//                    width: 32,
//                    height: 32,
//                    child: Image.asset("assets/supplement.png"),
//                  ),
                  Text('Relatório',
                      style: TextStyle(color: Colors.grey[600],
                                        fontSize: 15,
//                                        fontWeight: FontWeight.bold,
                              ),
                  ),
                ],
              ),
              ),
            onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportView()),
                );
              },
            ),
          ],
      ),
    );

  }

}