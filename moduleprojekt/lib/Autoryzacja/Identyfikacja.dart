import 'package:flutter/material.dart';
import 'package:moduleprojekt/Autoryzacja/Zarejestruj.dart';
import 'package:moduleprojekt/Autoryzacja/logowanie.dart';

class Identyfikacja extends StatefulWidget {
  const Identyfikacja({Key? key}) : super(key: key);

  @override
  State<Identyfikacja> createState() => _IdentyfikacjaState();
}

class _IdentyfikacjaState extends State<Identyfikacja> {
  bool zalogowany = true;
  void tViev() {
    setState(() => zalogowany = !zalogowany);
  }

  @override
  Widget build(BuildContext context) {
    if (zalogowany) {
      return logowaniePage(tViev: tViev);
    } else {
      return zarejestrujPage(tViev: tViev);
    }
  }
}
