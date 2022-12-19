import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:moduleprojekt/Skaner/AparatSkaner.dart';
import 'package:moduleprojekt/Skaner/PlikiSkaner.dart';
import 'package:moduleprojekt/Skaner/SkanerPages.dart';
import 'package:moduleprojekt/navigation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class Zrobzdjecie  extends StatefulWidget {
  const Zrobzdjecie({Key? key}) : super(key: key);

  @override
  State<Zrobzdjecie> createState() => _Zrobzdjecie();
}


class _Zrobzdjecie extends State<Zrobzdjecie> {

  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for captured image

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if(cameras != null){
      controller = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }else{
      print("NO any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      body: Container(
          child: Column(
              children:[
                Container(
                    height:300,
                    width:400,
                    child: controller == null?
                    Center(child:Text("Loading Camera...")):
                    !controller!.value.isInitialized?
                    Center(
                      child: CircularProgressIndicator(),
                    ):
                    CameraPreview(controller!)
                ),

                ElevatedButton.icon( //image capture button
                  onPressed: () async{
                    try {
                      if(controller != null){ //check if contrller is not null
                        if(controller!.value.isInitialized){ //check if controller is initialized
                          image = await controller!.takePicture(); //capture image
                          setState(() {
                            //update UI
                          });
                        }
                      }
                    } catch (e) {
                      print(e); //show error
                    }
                  },
                  icon: Icon(Icons.camera),
                  label: Text("Capture"),
                ),

                Container( //show captured image
                  padding: EdgeInsets.all(30),
                  child: image == null?
                  Text("No image captured"):
                  Image.file(File(image!.path), height: 300,),
                  //display captured image
                )
              ]
          )
      ),

    );
  }
}