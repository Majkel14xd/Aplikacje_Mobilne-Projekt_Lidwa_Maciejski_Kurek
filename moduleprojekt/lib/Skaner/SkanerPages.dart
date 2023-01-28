import 'package:flutter/material.dart';
import 'package:moduleprojekt/Skaner/AparatSkaner.dart';
import 'package:moduleprojekt/Skaner/PlikiSkaner.dart';
import 'package:moduleprojekt/navigation.dart';
import 'package:moduleprojekt/Skaner/zrobzdjecie.dart';

class ScannerWidget extends StatefulWidget {
  const ScannerWidget({super.key});

  @override
  State<ScannerWidget> createState() => _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    AparatSkaner(),
    Zrobzdjecie(),
    PlikiSkaner()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skaner'),
      ),
      drawer: WidgetNavigation(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Skaner QR_CODE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Aparat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_upload),
            label: 'Wybierz plik',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}
