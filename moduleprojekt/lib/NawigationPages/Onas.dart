import 'package:flutter/material.dart';
import 'package:moduleprojekt/navigation.dart';

class OnasPage extends StatelessWidget {
  const OnasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikacja Biletowa'),
      ),
      drawer: WidgetNavigation(),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                child: Image.asset('images/walka.png')),
            Row(
                children:[
                  Expanded(
                      child:
                      Text('3 dzielnych studentów walczących z ciągłymi błędami kompilacji tego kodu')
                  )
                ]),
              ],
            ),
          ),
    );
  }
}
