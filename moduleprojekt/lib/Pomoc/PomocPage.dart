import 'package:flutter/material.dart';
import 'package:moduleprojekt/navigation.dart';

class PomocPage extends StatelessWidget {
  const PomocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikacja Biletowa'),
      ),
      drawer: WidgetNavigation(),
      body: Text(
        "Pomoc!!!!",
      ),
    );
  }
}
