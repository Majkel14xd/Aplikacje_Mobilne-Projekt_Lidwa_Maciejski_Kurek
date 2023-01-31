import 'package:flutter/material.dart';
import 'package:moduleprojekt/navigation.dart';
import 'package:moduleprojekt/Settings/bezpieczenstwo.dart';
import 'package:moduleprojekt/Settings/motywy.dart';
import 'package:moduleprojekt/Settings/sortuj.dart';
import 'package:moduleprojekt/Settings/daneużytkownika.dart';

class SettingPages extends StatelessWidget {
  const SettingPages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      appBar: AppBar(
        title: Text("Ustawienia"),
      ),
      drawer: WidgetNavigation(),
      body: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              Przyciski(
                icons: Icons.account_circle,
                title: 'DANE UŻYTKOWNIKA',
                index: 0,
              ),
              const SizedBox(height: 15),
              Przyciski(
                icons: Icons.security_sharp,
                title: 'BEZPIECZEŃSTWO',
                index: 1,
              ),
              const SizedBox(height: 15),
              Przyciski(
                icons: Icons.auto_awesome_mosaic_outlined,
                title: 'ZMIANA MOTYWU',
                index: 2,
              ),
              const SizedBox(height: 15),
              Przyciski(
                icons: Icons.swap_horizontal_circle,
                title: 'SORTUJ BILETY',
                index: 3,
              ),
              const SizedBox(height: 15),
              Przyciski(
                icons: Icons.keyboard_backspace_sharp,
                title: 'COFNIJ',
                index: 100,
              ),
              Image.network(
                  'https://cdn.pixabay.com/photo/2019/03/11/21/18/city-4049526_1280.png'),
            ],
          )),
    );
  }

  BoxDecoration myBoxDecoration() {
    return const BoxDecoration(
      color: Colors.teal,
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    );
  }
}

class Przyciski extends StatelessWidget {
  Przyciski({this.title, required this.icons, this.index});
  final title;
  final IconData icons;
  final index;
  final pages = [
    MyApp(),
    bezpieczenstwo(),
    Motyw(),
    Sortuj(),
  ];
  @override

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (index == 100) {
          Navigator.pop(context);
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => pages[index]));
        }
      },
      child: Card(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  height: 55,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.all(
                        Radius.circular(5.0) //         <--- border radius here
                        ),
                  ),
                  child: Icon(
                    icons,
                    color: Colors.white,
                  ),
                )),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
