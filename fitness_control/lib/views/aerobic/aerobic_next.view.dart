import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:fitness_control/themes/colors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'aerobic.view.dart';

class AerobicNextView extends StatefulWidget {

  @override
  _AerobicNextView createState() => _AerobicNextView();
}

class _AerobicNextView extends State<AerobicNextView> {

  CountDownController _controller = CountDownController();
  bool _isPause = false;
  int _selectedIndex = 0;
  bool restart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text("Aeróbico Atual"),
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
      body: Center(
        child: CircularCountDownTimer(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          duration: 10,
          fillColor: Colors.amber,
          color: Colors.grey,
          controller: _controller,
          backgroundColor: Colors.white54,
          strokeWidth: 10.0,
          strokeCap: StrokeCap.round,
          isTimerTextShown: true,
          isReverse: false,
          autoStart: true,
          onComplete: (){
            if (!restart){
              Alert(
                context: context,
                title: 'Aeróbico Finalizado!',
                style: AlertStyle(
                  isCloseButton: true,
                  isButtonVisible: false,
                  titleStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 24.0,
                  ),
                ),
                closeFunction: (){
                  Navigator.pop(
                    context
                  );
                  Navigator.pop(
                    context
                  );
                }, 
                type: AlertType.success,
              ).show();
            }
          },
          textStyle: TextStyle(fontSize: 50.0, color: Colors.black),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
          //backgroundColor: Color.fromRGBO(255, 255, 255, .2),
          currentIndex: _selectedIndex, //New
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.refresh,                
                color: Colors.black54),
              title: Text('Reiniciar',
                style: TextStyle(color: Colors.black54,
                                 fontSize: 15,
                                 //fontWeight: FontWeight.bold,
                                ),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pause,
                 color: Colors.black54),
              title: Text('Pausar / Parar',
                style: TextStyle(color: Colors.black54,
                                 fontSize: 15,
                                 //fontWeight: FontWeight.bold,
                                ),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow,
                color: Colors.black54),
              title: Text('Iniciar / Resumir',
                style: TextStyle(color: Colors.black54,
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold,
                                ),),
            ),
          ],
          onTap: _onItemTapped,
        ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0){
        restart = true;
        _isPause = true;
        _controller.restart(); 
        restart = false;      
      }
      if (_selectedIndex == 1){
        restart = false;
        _isPause = true;
        _controller.pause();        
      }
      if (_selectedIndex == 2){
        restart = false;
        _isPause = false;
        _controller.resume();        
      }

    });
  }

}