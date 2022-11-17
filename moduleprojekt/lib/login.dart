import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

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

class UserPreferences {
  static const myUser = User(
    imagePath:
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    name: 'Imie i Nazwisko',
    email: 'email',
    about:
    'Wypisz tutaj ulgi , pamiętaj że każdą ulgę należy okazać dokumentem',
  );
}
//-----------------------------------------------------------------------------------wygląd profilu domyslnie
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

        return Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 24),
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },

              ),

              const SizedBox(height: 24),
              buildName(user),
              const SizedBox(height: 48),
              buildAbout(user),
            ],
          ),
        );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: const TextStyle(color: Colors.grey),
      )
    ],
  );


  Widget buildAbout(User user) => Container(
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
          user.about,
          style: const TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );
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
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 24),
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Imie i Nazwisko',
              text: user.name,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Aktualne zniżki',
              text: user.about,
              maxLines: 5,
              onChanged: (about) {},
            ),
            const SizedBox(height: 24),
            Przyciski(
              icons: Icons.save_as_outlined,
              title: 'Zapisz zmiany',
              index: 100,
            ),
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
