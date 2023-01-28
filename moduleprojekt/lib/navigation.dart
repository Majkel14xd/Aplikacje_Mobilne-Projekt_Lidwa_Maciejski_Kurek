import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moduleprojekt/NawigationPages/Bilety.dart';
import 'package:moduleprojekt/NawigationPages/Onas.dart';
import 'package:moduleprojekt/NawigationPages/Profil.dart';
import 'package:moduleprojekt/NawigationPages/informacje.dart';
import 'package:moduleprojekt/Autoryzacja/Autoryzacja.dart';

class NawigationPages extends StatelessWidget {
  NawigationPages({this.title, required this.icon, this.index});
  final title;
  final IconData icon;
  final index;
  @override
  Widget build(BuildContext context) {
    final pages = [
      ProfilPage(),
      BiletyPage(),
      InformacjePage(),
      OnasPage(),
    ];
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => pages[index]));
      },
      child: ListTile(
        leading: Icon(
          icon,
        ),
        title: Text(
          title,
        ),
      ),
    );
  }
}

class WidgetNavigation extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  WidgetNavigation({Key? key});
  final Autoryzacja _klucz = Autoryzacja();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: new Text(_auth.currentUser!.displayName.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            accountEmail: new Text(
              _auth.currentUser!.email.toString(),
            ),
          ),
          NawigationPages(
            icon: Icons.person,
            title: "Profil",
            index: 0,
          ),
          NawigationPages(
            icon: Icons.airplane_ticket_outlined,
            title: "Bilety",
            index: 1,
          ),
          NawigationPages(
            icon: Icons.info_outline,
            title: "Inforacje",
            index: 2,
          ),
          NawigationPages(
            icon: Icons.youtube_searched_for_outlined,
            title: "O nas",
            index: 3,
          ),
          InkWell(
            onTap: () async {
              await _klucz.signOut(context);
            },
            child: ListTile(
              leading: Icon(
                Icons.logout,
              ),
              title: Text('Wyloguj'),
            ),
          ),
        ],
      ),
    );
  }
}
