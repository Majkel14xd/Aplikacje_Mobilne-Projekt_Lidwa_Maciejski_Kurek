import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moduleprojekt/main.dart';
import 'package:moduleprojekt/settings.dart';

class NawigationPages extends StatelessWidget {
  NawigationPages({this.title,required this.icon,this.index});
  final title;
  final IconData icon;
  final index;
  @override
  Widget build(BuildContext context) {
    final pages=[

    ];
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>pages[index]));
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
            icon: Icons.location_city_sharp,
            title: "Miasto",
            index: 3,
          ),
          NawigationPages(
            icon: Icons.youtube_searched_for_outlined,
            title: "O nas",
            index: 4,
          ),
        ],
      ),
    );
  }
}

