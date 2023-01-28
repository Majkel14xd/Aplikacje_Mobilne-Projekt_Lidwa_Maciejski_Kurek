import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moduleprojekt/modele/uzytkownik.dart';
import '../Autoryzacja/Autoryzacja.dart';
import 'ustawienia.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Profil uzytkownika';

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Strona Uzytkownika',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ProfilePage(),
    );
  }
}
class MyThemes {
  static const primary = Colors.teal;
  static final primaryColor = Colors.teal.shade300;
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: const BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: StadiumBorder(),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    ),
    child: Text(text),
    onPressed: onClicked,
  );
}

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 3,
    child: buildCircle(
      color: color,
      all: 8,
      child: Icon(
        isEdit ? Icons.add_a_photo : Icons.edit,
        color: Colors.white,
        size: 20,
      ),
    ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const TextFieldWidget({
    Key? key,
    this.maxLines = 1,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}
class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        widget.label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      const SizedBox(height: 8),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        maxLines: widget.maxLines,
      ),
    ],
  );
}


//-----------------------------------------------------------------------------------wygląd profilu domyslnie
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth user = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 24),
          ProfileWidget(
            imagePath: user.currentUser!.photoURL.toString(),
            onClicked: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            },

          ),

          const SizedBox(height: 24),
          buildName(),
          const SizedBox(height: 48),
          buildAbout(),
        ],
      ),
    );
  }

  Widget buildName() => Column(
    children: [
      Text(
        user.currentUser!.displayName.toString(),
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.currentUser!.email.toString(),
        style: const TextStyle(color: Colors.grey),
      )
    ],
  );
  Future<String> pobierzopis() async {
    String opis = await FirebaseFirestore.instance
        .collection('user')
        .doc(user.currentUser!.uid.toString())
        .get()
        .then((value) {
      return value.data()!['about']; // Access your after your get the data
    });
    return opis;
  }

  Widget buildAbout() {
    return FutureBuilder(
      future: pobierzopis(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Aktualne zniżki',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  snapshot.requireData,
                  style: const TextStyle(fontSize: 16, height: 1.4),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  //-----------------------------------------------------------------------do uzycia przy wyborze ulg zamiast tekstu
  final List<String> items = [
    'Niewidomy 93%',
    'Dziecko niepełnosprawne 78%',
    'Uczeń 49%',
    'Student 51%',
    'Nauczyciele 33%',
    'Funkcjonariusze publiczni 78%',
    'Poseł/Senator/Straż graniczna',
  ];
  String? selectedValue;


  Widget buildList(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomDropdownButton2(
          hint: 'Wybierz ulge',
          dropdownItems: items,
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
        ),
      ),
    );
  }
}
//----------------------------------------------------------------------------wygląd profilu edycji
class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
   String _name ='';
   String opis = '';
  @override

  Future dodajopis(String opis) async{
    try{
      return await FirebaseFirestore.instance.collection("user").doc(_auth.currentUser!.displayName.toString()).update({
        "about": opis
      });
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Widget build(BuildContext context) => Scaffold(
    appBar: buildAppBar(context),
    body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 24),
        ProfileWidget(
          imagePath: _auth.currentUser!.photoURL.toString(),
          isEdit: true,
          onClicked: () async {},
        ),
        const SizedBox(height: 24),
        TextFieldWidget(
          label: 'Nazwa uzytkownika',
          text: _auth.currentUser!.displayName.toString(),
          onChanged: (name) {
            setState(() {
              _name = name;
            });
          },
        ),
        const SizedBox(height: 24),
        TextFieldWidget(
          label: 'Email',
          text: "",
          onChanged: (email) {},
        ),
        const SizedBox(height: 24),
        TextFieldWidget(
          label: 'Aktualne zniżki',
          text: '',
          maxLines: 5,
          onChanged: (about) {
            opis = about;

          },
        ),
      const SizedBox(height: 24),
  ElevatedButton(
      onPressed: () async {
        _auth.currentUser!.updateDisplayName(_name);
        dodajopis(opis);
      },
      child: Text('Aktualizuj')
  ),
        const SizedBox(height: 24),
        Przyciski(
          icons: Icons.save_as_outlined,
          title: 'Zapisz zmiany',
          index: 100,
        )
      ],
    ),
  );
}
//---------------------------------------------------------------zmienne
class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
  });

}
