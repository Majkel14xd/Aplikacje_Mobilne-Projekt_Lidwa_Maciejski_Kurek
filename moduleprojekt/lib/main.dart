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
      home: const MyHomePage(title: 'Ustawienia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              _firstWidget(),
              const SizedBox(height: 15),
              _secondWidget(),
              const SizedBox(height: 15),
              _thirdWidget(),
              const SizedBox(height: 15),
              _fourthWidget(),
              const SizedBox(height: 15),
              _fifthWidget(),
              Image.network('https://cdn.pixabay.com/photo/2019/03/11/21/18/city-4049526_1280.png'),

            ],
          )),
    );
  }

  Widget _firstWidget() {
    return InkWell(
        onTap: () {},
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
                    decoration: myBoxDecoration(),
                    child: const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                  )),
              const Expanded(
                  flex: 3,
                  child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'DANE UŻYTKOWNIKA',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ))),
            ],
          ),
        ));
  }

  Widget _secondWidget() {
    return InkWell(
        onTap: () {},
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
                    decoration: myBoxDecoration(),
                    height: 55,
                    width: 30,
                    child: const Icon(
                      Icons.security_sharp,
                      color: Colors.white,
                    ),
                  )),
              const Expanded(
                  flex: 3,
                  child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'BEZPIECZEŃSTWO',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ))),
            ],
          ),
        ));
  }
  Widget _thirdWidget() {
    return InkWell(
        onTap: () {},
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
                    decoration: myBoxDecoration(),
                    height: 55,
                    width: 30,
                    child: const Icon(
                      Icons.auto_awesome_mosaic_outlined,
                      color: Colors.white,
                    ),
                  )),
              const Expanded(
                  flex: 3,
                  child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'OPCJE MOTYWU',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ))),
            ],
          ),
        ));
  }
  Widget _fourthWidget() {
    return InkWell(
        onTap: () {},
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
                    decoration: myBoxDecoration(),
                    height: 55,
                    width: 30,
                    child: const Icon(
                      Icons.swap_horizontal_circle,
                      color: Colors.white,
                    ),
                  )),
              const Expanded(
                  flex: 3,
                  child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'SORTUJ BILETY',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ))),
            ],
          ),
        ));
  }
  Widget _fifthWidget() {
    return InkWell(
        onTap: () {},
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
                    decoration: myBoxDecoration(),
                    height: 55,
                    width: 30,
                    child: const Icon(
                      Icons.keyboard_backspace_sharp,
                      color: Colors.white,
                    ),
                  )),
              const Expanded(
                  flex: 3,
                  child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'COFNIJ',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ))),
            ],
          ),
        ));
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

