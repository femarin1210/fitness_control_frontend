import 'package:fitness_control/controllers/assessment/assessment.controller.dart';
import 'package:fitness_control/models/assessment/assessment.model.dart';
import 'package:fitness_control/stores/app.store.dart';
import 'package:fitness_control/views/assessment/assessment.crud.view.dart';
import 'package:fitness_control/views/assessment/assessment.view.dart';
import 'package:fitness_control/views/diet/diet.view.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:masked_text/masked_text.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssessmentCrud1View extends StatefulWidget {
  
  final AssessmentModel assessmentUpdate;
  final String typeAssessment;
  AssessmentCrud1View({this.assessmentUpdate,this.typeAssessment});

  @override
  _AssessmentCrud1View createState() => _AssessmentCrud1View();
}

class _AssessmentCrud1View extends State<AssessmentCrud1View> {

  final _formKey = GlobalKey<FormState>();
  final _controller = AssessmentController();
  var assessment = AssessmentModel();
  var _assessment = AssessmentModel();
  bool isTrue;

  bool editado = false;
  AssessmentModel _editAssessment;

  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _fatPercentageController = TextEditingController();
  final _chestController = TextEditingController();
  final _bicepsController = TextEditingController();
  final _waistController = TextEditingController();
  final _hipController = TextEditingController();
  final _thighController = TextEditingController();
  final _calfController = TextEditingController();

  final _data = TextEditingController();

  DateTime _date = DateTime.now();

  Future<Null> _selectcDate(BuildContext context, String formField) async {

    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1990),
      lastDate: DateTime(2030),
    );
    
    if (picked != null && picked != _date) {
      final datept = DateFormat("dd/MM/yyyy").format(picked);
      setState(() {
        _date = picked;
        if (formField == "dateIni"){
          _data.text = datept.toString();
        }
        print(datept.toString());
      });
      }
    }


  @override
  void initState(){
    super.initState();

    if (widget.assessmentUpdate == null){
      _editAssessment = AssessmentModel(); 
    }else{
      _editAssessment = AssessmentModel.fromMap(widget.assessmentUpdate.toMap());

      _titleController.text = _editAssessment.title;
      _heightController.text = _editAssessment.height.toString();
      _weightController.text = _editAssessment.weight.toString(); 
      _fatPercentageController.text = _editAssessment.fatPercentage.toString();
      _chestController.text = _editAssessment.chest.toString();
      _bicepsController.text = _editAssessment.biceps.toString();
      _waistController.text = _editAssessment.waist.toString();
      _hipController.text = _editAssessment.hip.toString();
      _thighController.text = _editAssessment.thigh.toString();
      _calfController.text = _editAssessment.calf.toString();


    }
  }

  @override
  Widget build(BuildContext context) {

    var store = Provider.of<AppStore>(context);

    return Scaffold(
      //backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text(widget.typeAssessment == 'A' ? "Avalia????es" : "Metas"),
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
        //padding: EdgeInsets.only(top:20, left: 16, right: 16, bottom: 16),
        child:
   ListView(children: <Widget>[
              SingleChildScrollView(child:
      Container(
        padding: EdgeInsets.only(top:20, left: 16, right: 16, bottom: 16),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
 
        Form(
            key: _formKey,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
/*        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
        Padding(
        padding: EdgeInsets.only(right: 8, top: 8, bottom: 8),
        child: Text('Tipo Cadastro:',
            style: TextStyle(fontSize: 16))
          ),
            Radio(
              value: 1,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'Avalia????o';
                  id = 1;
                });
              },
            ),
            Text(
              'Avalia????o',
              style: new TextStyle(fontSize: 17.0),
            ),
 
            Radio(
              value: 2,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'Meta';
                  id = 2;
                });
              },
            ),
            Text(
              'Meta',
              style: new TextStyle(
                fontSize: 17.0,
              ),
            ),
            
          ],
        ),
        SizedBox(height: 12,), */

        TextFormField(
              //initialValue: "Avalia????o Outubro",
              controller: _titleController,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "T??tulo",
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
                  return 'Informe o t??tulo da avalia????o/meta';
                }
                return null;
              },
              onSaved: (val) => setState(() => _assessment.title = val),
            ),
            SizedBox(
              height: 4,
            ),
            Text("Exemplos: Avalia????o Janeiro, Meta Mar??o, etc"),
SizedBox(height: 12,),
                Column(children: [
                  MaskedTextField(
                    mask: "xx/xx/xxxx",
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    maskedTextFieldController: _data,
                    // autofocus: true,
                      inputDecoration: InputDecoration(
                      labelText: "Data",
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                      counterText: "",
                      border: OutlineInputBorder(),
                    suffixIcon:
                      GestureDetector(child: 
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Icon(Icons.date_range
                          ),
                        ),
                        onTap: () {
                          _selectcDate(context, "date");
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 12,),

        TextFormField(
              //initialValue: '185',
              // autofocus: true,
              controller: _heightController,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
            TextInputFormatter.withFunction((oldValue, newValue) {
              try {
                final text = newValue.text;
                if (text.isNotEmpty) double.parse(text);
                  return newValue;
              } catch (e) {}
              return oldValue;
            }),
          ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Altura",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 20),
              onSaved: (val) => setState(() => _assessment.height = double.parse(val)),
            ),
SizedBox(height: 12,),
        TextFormField(
              //initialValue: '93',
              // autofocus: true,
              controller: _weightController,
              //keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
            TextInputFormatter.withFunction((oldValue, newValue) {
              try {
                final text = newValue.text;
                if (text.isNotEmpty) double.parse(text);
                  return newValue;
              } catch (e) {}
              return oldValue;
            }),
          ],
          keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Peso",
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
                  return 'Informe o peso';
                }
                return null;
              },
              onSaved: (val) => setState(() => _assessment.weight = double.parse(val)),
            ),
SizedBox(height: 12,),
        TextFormField(
              //initialValue: '15.25',
              // autofocus: true,
              controller: _fatPercentageController,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
            TextInputFormatter.withFunction((oldValue, newValue) {
              try {
                final text = newValue.text;
                if (text.isNotEmpty) double.parse(text);
                  return newValue;
              } catch (e) {}
              return oldValue;
            }),
          ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Percentual de Gordura",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 20),
              onSaved: (val) => setState(() => _assessment.fatPercentage = double.parse(val)),
            ),
SizedBox(height: 14,),
Text("Medidas",
  style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),),
SizedBox(height: 14,),
        TextFormField(
              //initialValue: '105',
              // autofocus: true,
              controller: _chestController,
              inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Peitoral em Cent??metros",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 20),
              onSaved: (val) => setState(() => _assessment.chest = int.parse(val)),
            ),
SizedBox(height: 12,),
        TextFormField(
              //initialValue: '44',
              // autofocus: true,
              controller: _bicepsController,
              inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Biceps em Cent??metros",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 20),
              onSaved: (val) => setState(() => _assessment.biceps = int.parse(val)),
            ),

SizedBox(height: 12,),
        TextFormField(
              //initialValue: '82',
              // autofocus: true,
              controller: _waistController,
              inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Cintura em Cent??metros",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 20),
              onSaved: (val) => setState(() => _assessment.waist = int.parse(val)),
            ),

SizedBox(height: 12,),
        TextFormField(
              //initialValue: '94',
              // autofocus: true,
              controller: _hipController,
              inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Quadril em Cent??metros",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 20),
              onSaved: (val) => setState(() => _assessment.hip = int.parse(val)),
            ),

SizedBox(height: 12,),
        TextFormField(
              //initialValue: '60',
              // autofocus: true,
              controller: _thighController,
              inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Coxa em Cent??metros",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 20),
              onSaved: (val) => setState(() => _assessment.thigh = int.parse(val)),
            ),

SizedBox(height: 12,),
        TextFormField(
              //initialValue: '52',
              // autofocus: true,
              controller: _calfController,
              inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Panturrilha em Cent??metros",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 20),
              onSaved: (val) => setState(() => _assessment.calf = int.parse(val)),
            ),

                ],
              ),

            ],
                        
            ),),

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
                        widget.assessmentUpdate == null ? "Finalizar Cadastro" : "Atualizar",
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

                        _assessment.type = widget.typeAssessment;
                        _assessment.id = 0;
                        _assessment.idUser = store.id;
                        _assessment.date = "01/10/2021";
                        _assessment.active = "Y";

                    //setState(() {});
                    //  _controller.create(model).then((data){                                  
                    //    setState(() {});
                        if (widget.assessmentUpdate == null) {
                          insertAssessment();
                        }else{
                          updateAssessment();
                        }
                    //}); 
                    }
                  },
                ),
              ),
            ),

          ],
        ),),
      ),

    ], ),),
            
      
    );
  }

  insertAssessment() async{

    //var store = Provider.of<AppStore>(context, listen: false);

    setState(() {});
    await AssessmentController().create(_assessment).then((data){
      setState(() { 
        isTrue = data;  
                    print(assessment.toJson());   
      });
    });

    if (isTrue) {
      Flushbar(
        message: widget.typeAssessment == 'A' ? "AVALIA????O INCLU??DA COM SUCESSO!" : "META INCLU??DA COM SUCESSO!",
        icon: Icon(
          Icons.check,
          size: 28.0,
          color: Colors.green[300],
          ),
        duration: Duration(seconds: 2),
        leftBarIndicatorColor: Colors.green[300],
      )..show(context);
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => AssessmentCrudView(),
        ),
      );
    }
/*
    if (user.accessToken != null) {
      store.setUser(user.id, user.name, user.email, user.password, "", user.typeUser, user.accessToken);
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
      );
    }else{
      Flushbar(
        message: "DADOS DE LOGIN INV??LIDOS!",
        icon: Icon(
          Icons.error,
          size: 28.0,
          color: Colors.red[300],
          ),
        duration: Duration(seconds: 5),
        leftBarIndicatorColor: Colors.red[300],
      )..show(context);
    }
    */
  } 

  updateAssessment() async{

    //var store = Provider.of<AppStore>(context, listen: false);

    setState(() {});
    await AssessmentController().update(_assessment, _editAssessment.id).then((data){
      setState(() { 
        isTrue = data;  
                    print(assessment.toJson());   
      });
    });

    if (isTrue) {
      Flushbar(
        message: widget.typeAssessment == 'A' ? "AVALIA????O ATUALIZADA COM SUCESSO!" : "META ATUALIZADA COM SUCESSO!",
        icon: Icon(
          Icons.check,
          size: 28.0,
          color: Colors.green[300],
          ),
        duration: Duration(seconds: 3),
        leftBarIndicatorColor: Colors.green[300],
      )..show(context);
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => AssessmentCrudView(),
        ),
      );
    }

  } 


}

