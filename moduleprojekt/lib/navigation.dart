import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moduleprojekt/main.dart';
import 'package:moduleprojekt/settings.dart';

class WidgetNavigation extends StatelessWidget {
  WidgetNavigation(this.nick,this.name);
  final nick;
  final name;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget> [
          UserAccountsDrawerHeader(
            accountName: new Text(
                nick,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                )
            ),
            accountEmail: new Text(
                name,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profil"),
          ),
          ListTile(
            leading: Icon(Icons.airplane_ticket_outlined),
            title: Text("Bilety"),
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("Inforacje"),
          ),
          ListTile(
            leading: Icon(Icons.location_city_sharp),
            title: Text("Miasto"),
          ),
          ListTile(
            leading: Icon(Icons.youtube_searched_for_outlined),
            title: Text("O nas"),
          ),
        ],
      ),
    );
  }
}
