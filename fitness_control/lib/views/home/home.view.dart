import 'package:fitness_control/stores/app.store.dart';
import 'package:fitness_control/views/aerobic/aerobic.crud.view.dart';
import 'package:fitness_control/views/aerobic/aerobic.view.dart';
import 'package:fitness_control/views/assessment/assessment.crud.view.dart';
import 'package:fitness_control/views/login/login.view.dart';
import 'package:fitness_control/views/profile/profile.view.dart';
import 'package:fitness_control/views/report/report.view.dart';
import 'package:fitness_control/views/workout/workoutList.view.dart';
import 'package:fitness_control/views/workout/workoutHome.view.dart';
import 'package:flutter/material.dart';
import 'package:fitness_control/themes/colors.dart';
import 'package:fitness_control/widgets/card_assessment.dart';
import 'package:fitness_control/widgets/card_goal.dart';
import 'package:fitness_control/widgets/tab_option.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget{

  static int currItem = 2;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState(){
    super.initState();
    isLoged().then((value) {
      print(value);
      if(!value){
        Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (context) => LoginView(),),);
      }
    });
  }

  final Shader linearGradient = 
    LinearGradient(
      colors: <Color>[Color(0xFF0000FF), Color(0XFF6495ED)],
    ).createShader(Rect.fromLTWH(0.0, 1.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context){

    var store = Provider.of<AppStore>(context);   

    return Scaffold(
      //backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text("Fitness Control"),
        //automaticallyImplyLeading: false,
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
        //backgroundColor: Color.fromRGBO(255, 255, 255, .2),
        centerTitle: true,
          actions: [
            Builder(
              builder: (context) => IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
            ),
          ],
//        actions: [], 
/*          <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.settings),
            color: Colors.black,
            elevation: 20,
                shape: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2
                    )
                ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Meu Perfil"),
                textStyle: TextStyle(color: Colors.white60),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("Permissões"),
                textStyle: TextStyle(color: Colors.white60),
                value: 2,
              ),
              PopupMenuItem(
                child: Text("Sair"),
                textStyle: TextStyle(color: Colors.white60),
                value: 2,
              )
            ]
          )
        ], */
      ),
      drawer: Drawer(
        child:ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.vertical(top: Radius.circular(50), bottom: Radius.circular(50)),
                color: Colors.black12,
              ),
            child:
            Column(
            children: <Widget>[
            Container(
              height: 80,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Icon(Icons.fitness_center,
                       color: Colors.grey[700],
                       size: 46),
                  SizedBox(width: 18),
                  Icon(Icons.restaurant,
                       color: Colors.grey[700],
                       size: 46),
                  SizedBox(width: 18),
                  Icon(Icons.directions_run,
                       color: Colors.grey[700],
                       size: 46),
                  Icon(Icons.delete_outline,
                       color: Colors.grey[700],
                       size: 46),
//                  SizedBox(
//                    width: 46,
//                    height: 46,
//                    child: Image.asset("assets/supplement.png"),
//                  ),
                ],
              ),
            ),
            Container(
              height: 32,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Text('Fitness Control',
                      style: new TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient),
                  ),
                ],
              ),
            ),
            ],
            ),
            ),
//            SizedBox(height: 15),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text("Avaliações"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AssessmentCrudView()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text("Treinos"),
              onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkoutListView()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_run),
              title: Text("Aeróbicos"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AerobicCrudView()),
                );                
              },
            ),
            ListTile(
              leading: Icon(Icons.import_contacts),
              title: Text("Relatório"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportView()),
                );
              },
            ),
//            ListTile(
//              leading: SizedBox(
//                    width: 32,
//                    height: 32,
//                    child: Image.asset("assets/supplement.png"),
//                  ),
//              title: Text("Suplementos"),
//              onTap: () {},
//            ),
          ]
        ),
      ),
      endDrawer: Drawer(
        child:ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: 
                Observer(
                  builder: (_) => Text(store.name,
                    style: TextStyle(fontSize: 17,
                                     color: Colors.black87,),),
                ),
              accountEmail: Text(store.email,
                style: TextStyle(fontSize: 16,
                                            color: Colors.black87,),),
              currentAccountPicture: 
                Icon(Icons.account_circle,
                  size: 82,
                  color: Colors.black45,),
              decoration: BoxDecoration(color: Colors.black12),
            ),
              ListTile(
              leading: Icon(Icons.person),
              title: Text("Meu Perfil"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileView()),
                );                
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text("Excluir Conta"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text("Sair"),
              onTap: (){
                store.accessToken = null;
                logout();
              },
            ),
          ]
        ),
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: currItem,
//        fixedColor: kPrimaryColor,
//        unselectedItemColor: Colors.black54,
//        //selectedItemColor: Colors.blue,
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: Icon(Icons.assessment), title: Text('a'), backgroundColor: Colors.black87),
//          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), title: Text('b')),
//          BottomNavigationBarItem(icon: Icon(Icons.restaurant), title: Text('c')),
//          BottomNavigationBarItem(icon: Icon(Icons.directions_run), title: Text('d')),
          //BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text('Configurações'))
//        ],
//      ),
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
      Container(
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        padding: const EdgeInsets.only(
          left: 2,
          bottom: 5,
          top: 15,
          right: 2
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
                width: 600,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [ 
                      CardAssessment(),
                      CardGoal(),
                    ]
                ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: 
              Card(
                elevation: 5,
                color: Colors.white,
                margin: EdgeInsets.only(right: 25, left: 25, bottom: 10),
                child: Row(              
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(3),
                      child: Icon(Icons.fitness_center,
                        color: Colors.blue,
                        size: 40,),
                    ),
                    SizedBox(width: 2),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(7),
                      width: MediaQuery.of(context).size.width * 0.64,
                      height: 68,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Próximo Treino:',
                            style: TextStyle(fontSize: 14,
                                            color: Colors.black54,)
                          ),
                          Text('Peito e Triceps',
                            style: TextStyle(fontSize: 15,
                                            color: Colors.black87,)
                          ),

                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      child: Icon(Icons.arrow_forward_ios,
                        color: Colors.black45,
                        size: 28,),
                    ),
                  ],
                ),
              ),
              onTap: () =>                        
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkoutListView()),
                ),              
            ),
            SizedBox(height: 5),
            GestureDetector(
              child:
              Card(
                elevation: 5,
                color: Colors.white,
                margin: EdgeInsets.only(right: 25, left: 25, bottom: 10),
                child: Row(              
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(3),
                      child: Icon(Icons.directions_run,
                        color: Colors.green[800],
                        size: 40,),
                    ),
                    SizedBox(width: 2),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(7),
                      width: MediaQuery.of(context).size.width * 0.64,
                      height: 68,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Próximo Aeróbico:',
                            style: TextStyle(fontSize: 14,
                                            color: Colors.black54,)
                          ),
                          Text('30 min. corrida ritmo médio',
                            style: TextStyle(fontSize: 15,
                                            color: Colors.black87,)
                          ),

                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      child: Icon(Icons.arrow_forward_ios,
                        color: Colors.black45,
                        size: 28,),
                    ),                    
                  ],
                )
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AerobicView()),
                );
              },
            ),
          ],
        ),
      ),
      ]),
      bottomNavigationBar: BottomAppBar(
        child: 
          TabOption(),
        
      ),
    );
  }

  Future<bool> isLoged() async{
//    SharedPreferences.setMockInitialValues({});
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString('token') != null){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> logout() async{
//    SharedPreferences.setMockInitialValues({});
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();

    Navigator.pushReplacement(context, 
    MaterialPageRoute(builder: (context) => LoginView(),),);
    return true;

  }

}
