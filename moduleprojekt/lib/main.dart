import 'package:flutter/material.dart';
import 'package:moduleprojekt/Pomoc/PomocPage.dart';
import 'package:moduleprojekt/Settings/ustawienia.dart';
import 'package:moduleprojekt/navigation.dart';
import 'package:moduleprojekt/Skaner/SkanerPages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikacja biletowa',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
      ),
      home: MenuStart(),
    );
  }
}

class MenuStart extends StatefulWidget {
  const MenuStart({Key? key}) : super(key: key);

  @override
  State<MenuStart> createState() => _MenuStartState();
}

class _MenuStartState extends State<MenuStart> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikacja Biletowa'),
      ),
      drawer: WidgetNavigation('KowalXD','TomaszKowalski'),
      body: Container(
        child:Center(
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
            Okienka(
              title: 'Menu',
              icon: Icons.menu,
              indexx: 0,
            ),
            Okienka(
              title: 'Skaner',
              icon: Icons.camera_alt_outlined,
              indexx: 1,
            ),
            Okienka(
              title: 'Ustawienia',
              icon: Icons.settings,
              indexx: 2,
            ),
            Okienka(
              title: 'Pomoc',
              icon: Icons.help_outline,
              indexx: 3,
            ),
          ],
          ),
        ),
      ),

    );
  }
}
class Okienka extends StatelessWidget {
  Okienka({this.title,required this.icon,this.indexx}) ;
  final title;
  final IconData icon;
  final indexx;
  @override
  Widget build(BuildContext context) {
    final pages=[
      MenuStart(),
      ScannerWidget(),
      SettingPages(),
      PomocPage(),
    ];
    return Container(
      margin: EdgeInsets.all(15),
      child:InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>pages[indexx]));
      },
      splashColor: Colors.teal,
      child:Center(
      child:Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
            Icon(
                icon,
                size: 70,
                color: Colors.teal,
            ),
            Text(
                title,
                style: new TextStyle(fontSize: 20.0),
            ),
        ],
      ),
      ),
      ),
    );
  }
}
