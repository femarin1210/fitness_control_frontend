import 'package:fitness_control/views/Aerobic/Aerobic.view.dart';
import 'package:fitness_control/views/diet/diet.view.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Aerobic.crud3.view.dart';

class AerobicCrud3View extends StatefulWidget {

  @override
  _AerobicCrud3View createState() => _AerobicCrud3View();
}

class _AerobicCrud3View extends State<AerobicCrud3View> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text("Aeróbicos"),
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
        alignment: Alignment.bottomRight,
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                          Text('Projeto: Projeto Verão',
                            style: TextStyle(fontSize: 18,
                                            color: Colors.black87,)
                          ),
                  SizedBox(height: 6,),
                          Text('Sequência: Quarta-feira',
                            style: TextStyle(fontSize: 16,
                                            color: Colors.black87,)
                          ),
            ],            
            ),

            SizedBox(height: 20,),
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
            Container(
              height: 44,
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
                        "Adicionar Exercícios",
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
                      MaterialPageRoute(builder: (context) => AerobicCrud3View()),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 44,
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
                        "Nova Sequência",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Icon(Icons.add,
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
                      MaterialPageRoute(builder: (context) => AerobicCrud3View()),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 44,
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
                        "Finalizar Cadastro",
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AerobicCrud3View()),
                    );
                  },
                ),
              ),
              
            ),
          ],
        ),
      ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            // Add your onPressed code here!
//          },
//          child: Icon(Icons.add),
//          backgroundColor: Colors.green,
//        ),
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
                    Text("Corrida média intensidade",
                    style: TextStyle(fontSize: 18),),
                    Text("30 minutos",
                    style: TextStyle(fontSize: 16),),
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                        SizedBox(width: 10,),
                        
                        GestureDetector(child: Icon(Icons.edit,
                        color: Colors.blue,),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AerobicView()),
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