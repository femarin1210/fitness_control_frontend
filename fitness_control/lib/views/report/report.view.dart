import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:masked_text/masked_text.dart';

class ReportView extends StatefulWidget {

  @override
  _ReportView createState() => _ReportView();
}

class _ReportView extends State<ReportView> {

    final _dataIniController = TextEditingController();
    final _dataFimController = TextEditingController();

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
          _dataIniController.text = datept.toString();
        }
        if (formField == "dateFim"){
          _dataFimController.text = datept.toString();
        }
        print(datept.toString());
      });
      }
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text("Relatório"),
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
        padding: EdgeInsets.only(top:20, left: 20, right: 20, bottom: 16),
        //height: MediaQuery.of(context).size.height * 1,
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
//            Text("Treino dia 1",
//              style: TextStyle(fontSize: 20),
//            ),
//            SizedBox(height: 10,),
            Text("Relatório de Desempenho",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54),
            ),
            SizedBox(height: 36,),
/*            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 20),
                isDense: true,
                hintText: "Data",
                prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Icon(Icons.alarm),
                )
              ),
              onTap: () {
                _selectcDate(context);
              },
            ), */
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child:
                Column(children: [
                  MaskedTextField(
                    mask: "xx/xx/xxxx",
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    maskedTextFieldController: _dataIniController,
                    // autofocus: true,
                      inputDecoration: InputDecoration(
                      labelText: "Data Inicial",
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    suffixIcon:
                      GestureDetector(child: 
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Icon(Icons.date_range
                          ),
                        ),
                        onTap: () {
                          _selectcDate(context, "dateIni");
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  MaskedTextField(
                    mask: "xx/xx/xxxx",
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    maskedTextFieldController: _dataFimController,
                    // autofocus: true,
                      inputDecoration: InputDecoration(
                      labelText: "Data Final",
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    suffixIcon:
                      GestureDetector(child: 
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Icon(Icons.date_range
                          ),
                        ),
                        onTap: () {
                          _selectcDate(context, "dateFim");
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
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
                        "Gerar Relatório",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Icon(Icons.import_contacts,
                                      size: 32,
                                      color: Colors.white),
                          height: 28,
                          width: 28,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => HomeView(),
//                      ),
//                    );
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}