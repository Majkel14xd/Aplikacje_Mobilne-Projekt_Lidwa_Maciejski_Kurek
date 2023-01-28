import 'package:flutter/material.dart';
import 'package:moduleprojekt/modele/uzytkownik.dart';
import 'package:provider/provider.dart';
import 'package:moduleprojekt/Autoryzacja/Identyfikacja.dart';
import 'package:moduleprojekt/main.dart';

class Sprawdzenie extends StatelessWidget {
  const Sprawdzenie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Uzytkownik?>(context);
    if (user == null) {
      return Identyfikacja();
    } else {
      return MenuStart();
    }
  }
}
