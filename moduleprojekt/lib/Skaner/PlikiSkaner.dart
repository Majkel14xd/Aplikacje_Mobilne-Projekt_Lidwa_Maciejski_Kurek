import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class PlikiSkaner extends StatefulWidget {
  const PlikiSkaner({Key? key}) : super(key: key);

  @override
  State<PlikiSkaner> createState() => _PlikiSkaner();
}

class _PlikiSkaner extends State<PlikiSkaner> {
  String _fileText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _pickFile, child: Text("Załaduj plik z biletem"),),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      // allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null && result.files.single.path != null) {
      /// Load result and file details
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);

      /// normal file
      File _file = File(result.files.single.path!);
      setState(() {
        _fileText = _file.path;
      });
    } else {
      /// User canceled the picker
    }
  }





/// currently only supported for Linux, macOS, Windows
/// If you want to do this for Android, iOS or Web, watch the following tutorial:
/// https://youtu.be/fJtFDrjEvE8


/// save file on Firebase


}