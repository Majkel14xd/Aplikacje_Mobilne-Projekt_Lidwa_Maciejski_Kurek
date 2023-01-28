import 'package:flutter/material.dart';
import 'package:moduleprojekt/Autoryzacja/Autoryzacja.dart';

class logowaniePage extends StatefulWidget {
  final Function tViev;
  logowaniePage({Key? key, required this.tViev}) : super(key: key);

  @override
  State<logowaniePage> createState() => _logowaniePageState();
}

class _logowaniePageState extends State<logowaniePage> {
  final Autoryzacja _auth = Autoryzacja();
  final _klucz = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _klucz,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Emaill pusty';
                  }
                  return null;
                },
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 8.0),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Błędne hasło';
                  }
                  return null;
                },
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () async {
                  if (_klucz.currentState!.validate()) {
                    dynamic result =
                        await _auth.logowanieHasloEmail(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Proszę podać poprawne dane';
                      });
                    }
                  }
                },
                child: Text(
                  'Zaloguj',
                ),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () async {
                  widget.tViev();
                },
                child: Text(
                  'Przejdz do rejestracji',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
