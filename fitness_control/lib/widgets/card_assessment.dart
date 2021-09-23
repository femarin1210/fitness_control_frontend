import 'package:flutter/material.dart';

class CardAssessment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 3,
        color: Colors.white,
        //margin: EdgeInsets.only(right: 5),
        child: Column(
          children: <Widget>[
            Container(child: mainBlock()),
          ],
        )
      ),
    );
  }

  Widget mainBlock(){
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset('assets/body1.png',
                            width: 87,
                            height: 90,
                ),
                Text('Atual',
                     style: TextStyle(fontSize: 18,
                                      color: Colors.black87))
              ]
            ),
            //SizedBox(height: 10),
            Text('Peso: 70 Kg',
                 style: TextStyle(fontSize: 16,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold)
            ),
            Text('Gordura: 14,5 %',
                 style: TextStyle(fontSize: 16,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold)
            ),
            Text('Taxa basal: 2500 Kl',
                 style: TextStyle(fontSize: 16,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold)
            ),
            Text('Biceps: 29 cm',
                 style: TextStyle(fontSize: 16,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold)
            ),
/*            Text('Peitoral: 108 cm',
                 style: TextStyle(fontSize: 16,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold)
            ),
            Text('Cintura: 85 cm',
                 style: TextStyle(fontSize: 16,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold)
            ),            
            Text('Quadril: 95 cm',
                 style: TextStyle(fontSize: 16,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold)
            ),     */
            //Spacer(),
          ]
        ),
      );
  }

}