import 'package:fitness_control/views/aerobic/aerobic_next.view.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AerobicView extends StatefulWidget {

  @override
  _AerobicView createState() => _AerobicView();
}

class _AerobicView extends State<AerobicView> {

  bool isChecked = false;

    //var check = List<bool>();
    var check = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ];
    
    var isMarked = false;

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
        padding: EdgeInsets.only(top:20, left: 20, right: 20, bottom: 16),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//            Text("Treino dia 1",
//              style: TextStyle(fontSize: 20),
//            ),
//            SizedBox(height: 10,),
            Text("Aeróbicos Quarta-Feira",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.centerRight,
              height: 40,
              child: FlatButton(
                child: Text(
                  isMarked ? 'Desmarcar Todos' : 'Marcar Todos',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  setState(() {
                    if(isMarked){
                      markOffAll(check);                    
                      isMarked = false;
                    }else{
                      markAll(check);  
                      isMarked = true;                  
                    }
                  });
                },
              ),
            ),
            Expanded(
              child:ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(0.0),
                itemCount: 2,
                itemBuilder: (context,index) {
                  return _listMeals(context, index);
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
                        "Finalizar Dia",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Icon(Icons.directions_run,
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

  _listMeals(BuildContext context, int index){

    //bool isChecked = false;

    return Card(
        elevation: 6,
        child: Padding(padding: EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("06:30 - 45 min Caminhada",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text("Ritmo médio",
                      style: TextStyle(fontSize: 15),
                    ),

                    SizedBox(height: 5,),
                    Container(
                      height: 30,
                      width: 120,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.1, 1],
                          colors: [
                            Color(0XFF32CD32),
                            Color(0xFF008000),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: SizedBox.expand(
                        child: FlatButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Iniciar",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                child: SizedBox(
                                  child: Icon(Icons.play_arrow,
                                              size: 28,
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
                              MaterialPageRoute(
                                builder: (context) => AerobicNextView(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),

                  ],
                ),
              ),
              Checkbox(
                value: check[index],
                activeColor: Colors.green,
                key: Key(index.toString()),
                onChanged:(newValeu){
                  print(newValeu); 
                  print(index.toString());
                  setState(() {
                    check[index] = newValeu;
                  });
                },
              ),
            ],
          )
        ),
      );
  }
}

void markAll(List check){
  check[0] = true;
  check[1] = true;
  check[2] = true;
  check[3] = true;
  check[4] = true;
  check[5] = true;
  check[6] = true;
  check[7] = true;
  check[8] = true;
  check[9] = true;
}

void markOffAll(List check){
  check[0] = false;
  check[1] = false;
  check[2] = false;
  check[3] = false;
  check[4] = false;
  check[5] = false;
  check[6] = false;
  check[7] = false;
  check[8] = false;
  check[9] = false;
}
