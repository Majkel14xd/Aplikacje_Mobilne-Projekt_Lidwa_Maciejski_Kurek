import 'package:flutter/material.dart';
import 'package:moduleprojekt/Settings/ustawienia.dart';

class Sortuj extends StatelessWidget {
  const Sortuj({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      appBar: AppBar(
        title: Text("SORTUJ BILETY"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 15),

            Przyciski(
              icons: Icons.keyboard_backspace_sharp,
              title: 'COFNIJ',
              index: 100,
            ),
            //Image.network('https://cdn.pixabay.com/photo/2019/03/11/21/18/city-4049526_1280.png'),
          ],
        ),
      ),
    );
  }
}
