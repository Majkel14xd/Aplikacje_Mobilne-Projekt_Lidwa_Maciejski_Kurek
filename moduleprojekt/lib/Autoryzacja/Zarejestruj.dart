import 'package:flutter/material.dart';
import 'package:moduleprojekt/Autoryzacja/Autoryzacja.dart';

class zarejestrujPage extends StatefulWidget {
  final Function tViev;
  zarejestrujPage({Key? key, required this.tViev}) : super(key: key);

  @override
  State<zarejestrujPage> createState() => _zarejestrujPageState();
}

class _zarejestrujPageState extends State<zarejestrujPage> {
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
                        await _auth.rejestracjaHasloEmail(email, password);
                    dynamic result2 = await _auth.rejestracjakontadobazy(email);
                    if (result == null && result2 == null) {
                      setState(() {
                        error = 'Proszę podać poprawne dane';
                      });
                    }
                  }
                },
                child: Text(
                  'Zarejestruj',
                ),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () async {
                  widget.tViev();
                },
                child: Text(
                  'Przejdz do logowania',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
