import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Zrobzdjecie extends StatefulWidget {
  const Zrobzdjecie({Key? key}) : super(key: key);
  @override
  State<Zrobzdjecie> createState() => _Zrobzdjecie();
}

class _Zrobzdjecie extends State<Zrobzdjecie> {
  List<CameraDescription>? cameras;
  CameraController? controller;
  XFile? image;

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("Nie znaleziono żadnej kamery");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                height: 300,
                width: 400,
                child: controller == null
                    ? Center(child: Text("Loading Camera..."))
                    : !controller!.value.isInitialized
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : CameraPreview(controller!)),
            ElevatedButton.icon(
              onPressed: () async {
                try {
                  if (controller != null) {
                    if (controller!.value.isInitialized) {
                      image = await controller!.takePicture();
                      setState(() {});
                    }
                  }
                } catch (e) {
                  print(e);
                }
              },
              icon: Icon(Icons.camera),
              label: Text("Capture"),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: image == null
                  ? Text("Żaden obraz nie został przechwycony")
                  : Image.file(
                      File(image!.path),
                      height: 300,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
