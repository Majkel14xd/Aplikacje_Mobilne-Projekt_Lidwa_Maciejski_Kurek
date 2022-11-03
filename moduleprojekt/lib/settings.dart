import 'package:flutter/material.dart';
import 'package:moduleprojekt/navigation.dart';
import 'main.dart';

class SettingPages extends StatelessWidget {
  const SettingPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: WidgetNavigation('KowalXD','TomaszKowalski'),
      body: Text(
        "Ala Ma kota",
      ),
    );
  }
}



