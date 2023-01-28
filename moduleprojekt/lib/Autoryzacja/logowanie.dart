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
        color: Colors.grey[900],
        alignment: Alignment.topCenter,
        child: Form(
          key: _klucz,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 400,
                  height: 220,
                  child: Image.asset('images/logoapki.png')),
              SizedBox(
                width: 350,
                child: TextFormField(
                  style: const TextStyle(color: Colors.teal),
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.teal),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      labelText: 'Adres e-mail'),
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
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: 350,
                child: TextFormField(
                  style: const TextStyle(color: Colors.teal),
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.teal),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    labelText: 'Hasło',
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Podaj hasło';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
              ),
              const SizedBox(height: 8.0),
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
                child: const Text(
                  'Zaloguj',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () async {
                  widget.tViev();
                },
                child: const Text(
                  'Przejdz do rejestracji',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
