import 'package:fitness_control/models/assessment/assessment.model.dart';
import 'package:fitness_control/repositories/assessment/assessment.repository.dart';
import 'package:fitness_control/views/aerobic/aerobic.view.dart';
import 'package:fitness_control/views/diet/diet.view.dart';
import 'package:fitness_control/views/assessment/assessment.crud1.view.dart';
import 'package:fitness_control/views/assessment/assessment.view.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AssessmentCrudView extends StatefulWidget {

  @override
  _AssessmentCrudView createState() => _AssessmentCrudView();
}

class _AssessmentCrudView extends State<AssessmentCrudView> {

  AssessmentRepository assessmentRepository = AssessmentRepository();
  List<AssessmentModel> assessments = List<AssessmentModel>();
  bool isDelete;

  @override
  void initState(){
    super.initState();

    _showAssessments();

  }

  void _showAssessments() async {
    await assessmentRepository.getAssessments(5).then((lista){
      setState(() {
        assessments = lista;
        for(final assessment in assessments){
          print(assessment.id);
        }
      });
    });
  }

  void _deleteAssessment(int id) async {
    await assessmentRepository.deleteAssessment(id).then((lista){
      setState(() {
        isDelete = lista;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text("Avaliações"),
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
                        "Cadastrar nova Avaliação",
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
                      MaterialPageRoute(builder: (context) => AssessmentCrud1View()),
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
                  MaterialPageRoute(builder: (context) => AssessmentView()),
                );},                        
                        ),
                    
//                    FlatButton(
                       SizedBox(width: 10,),
                       GestureDetector(child:Icon(Icons.delete,
                        color: Colors.red,),
              onTap: (){
                _mensagemConfirma(context, 
                                  assessments[index].id, 
                                  index, 
                                  "Exclusão!",
                                  "Confirma exclusão do registro?\n\n" + assessments[index].title);
              },
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
                  _deleteAssessment(assessmentid);
                });
                Navigator.of(context).pop();
              }, 
            ),
          ],
        );
      }
    );
  }

}

