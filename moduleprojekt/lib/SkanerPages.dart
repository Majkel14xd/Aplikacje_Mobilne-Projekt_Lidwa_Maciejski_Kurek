import 'package:flutter/material.dart';
import 'package:moduleprojekt/navigation.dart';

class SkanerPages extends StatefulWidget {
  const SkanerPages({Key? key}) : super(key: key);

  @override
  State<SkanerPages> createState() => _SkanerPagesState();
}

class _SkanerPagesState extends State<SkanerPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skaner'),

      ),
      drawer: WidgetNavigation('KowalXD','TomaszKowalski'),
      body: Text(
        "Ala Ma kota",
      ),
    );
  }
}
