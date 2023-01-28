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
                        await _auth.rejestracjaHasloEmail(email, password);
                    dynamic result2 = await _auth.rejestracjakontadobazy(email);
                    if (result == null && result2 == null) {
                      setState(() {
                        error = 'Proszę podać poprawne dane';
                      });
                    }
                  }
                },
                child: const Text(
                  'Zarejestruj',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () async {
                  widget.tViev();
                },
                child: const Text(
                  'Przejdz do logowania',
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
