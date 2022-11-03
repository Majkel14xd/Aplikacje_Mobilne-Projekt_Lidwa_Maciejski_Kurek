import 'package:flutter/material.dart';
import 'package:moduleprojekt/navigation.dart';

class InformacjePage extends StatelessWidget {
  const InformacjePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikacja Biletowa'),
      ),
      drawer: WidgetNavigation('KowalXD','TomaszKowalski'),
      body: Text(
        "Informacje",
      ),

    );
  }
}
