import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: const Ustawienia(title: 'Ustawienia'),
    );
  }
}

class Ustawienia extends StatefulWidget {
  const Ustawienia({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Ustawienia> createState() => _Ustawienia();
}

class _Ustawienia extends State<Ustawienia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left:10,top:10,right: 10),
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
              Image.network('https://cdn.pixabay.com/photo/2019/03/11/21/18/city-4049526_1280.png'),

            ],
          )),
    );
  }

  BoxDecoration myBoxDecoration() {
    return const BoxDecoration(
      color: Colors.teal,
      borderRadius: BorderRadius.all(
          Radius.circular(5.0) //         <--- border radius here
      ),
    );
  }
  }
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------


class Przyciski extends StatelessWidget {
   Przyciski({this.title,required this.icons , this.index});
    final title;
    final IconData icons;
    final index;
    final pages=[
      daneuzytkownika(),
      bezpieczenstwo(),
      Motyw(),
      Sortuj(),
    ];
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if(index==100)
            {
              Navigator.pop(context);
            }else
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => pages[index]));
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
                    child:Icon(
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
                      ))),
            ],
          ),
        ));
  }
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------
class daneuzytkownika extends StatelessWidget {
  const daneuzytkownika({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      appBar: AppBar(
        title: Text("DANE UŻYTKOWNIKA"),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left:10,top:10,right: 10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              Przyciski(
                icons: Icons.keyboard_backspace_sharp,
                title: 'COFNIJ',
                index: 100,
              ),
              Image.network('https://cdn.pixabay.com/photo/2019/03/11/21/18/city-4049526_1280.png'),

            ],
          ),
    )
    );
  }
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------

class bezpieczenstwo extends StatelessWidget {
  const bezpieczenstwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal.shade400,
        appBar: AppBar(
          title: Text("BEZPIECZEŃSTWO"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left:10,top:10,right: 10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              Przyciski(
                icons: Icons.keyboard_backspace_sharp,
                title: 'COFNIJ',
                index: 100,
              ),
              Image.network('https://cdn.pixabay.com/photo/2019/03/11/21/18/city-4049526_1280.png'),

            ],
          ),
        )
    );
  }
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------
class Motyw extends StatelessWidget {
  const Motyw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal.shade400,
        appBar: AppBar(
          title: Text("ZMIANA MOTYWU"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left:10,top:10,right: 10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              Przyciski(
                icons: Icons.keyboard_backspace_sharp,
                title: 'COFNIJ',
                index: 100,
              ),
              Image.network('https://cdn.pixabay.com/photo/2019/03/11/21/18/city-4049526_1280.png'),

            ],
          ),
        )
    );
  }
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------

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
          padding: const EdgeInsets.only(left:10,top:10,right: 10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              Przyciski(
                icons: Icons.keyboard_backspace_sharp,
                title: 'COFNIJ',
                index: 100,
              ),
              Image.network('https://cdn.pixabay.com/photo/2019/03/11/21/18/city-4049526_1280.png'),

            ],
          ),
        )
    );
  }
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------
