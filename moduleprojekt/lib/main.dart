import 'package:flutter/material.dart';
import 'package:moduleprojekt/Autoryzacja/SprawdzenieLogowania.dart';
import 'package:moduleprojekt/Pomoc/PomocPage.dart';
import 'package:moduleprojekt/Settings/ustawienia.dart';
import 'package:moduleprojekt/modele/uzytkownik.dart';
import 'package:moduleprojekt/navigation.dart';
import 'package:moduleprojekt/Skaner/SkanerPages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:moduleprojekt/Autoryzacja/Autoryzacja.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCSqrrd2-wx3yqGqrwDM6l2Ozd08kbG72I",
      appId: "1:612518199119:android:2d4433c9b5e38b9e2dcf3a",
      messagingSenderId: "612518199119",
      projectId: "am-projekt-d687c",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Uzytkownik?>.value(
      value: Autoryzacja().u,
      initialData: null,
      child: MaterialApp(
        title: 'Aplikacja biletowa',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Sprawdzenie(),
      ),
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
      drawer: WidgetNavigation(),
      body: Container(
        child: Center(
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
  Okienka({this.title, required this.icon, this.indexx});
  final title;
  final IconData icon;
  final indexx;
  @override
  Widget build(BuildContext context) {
    final pages = [
      MenuStart(),
      ScannerWidget(),
      SettingPages(),
      PomocPage(),
    ];
    return Container(
      margin: EdgeInsets.all(15),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => pages[indexx]));
        },
        splashColor: Colors.teal,
        child: Center(
          child: Column(
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
