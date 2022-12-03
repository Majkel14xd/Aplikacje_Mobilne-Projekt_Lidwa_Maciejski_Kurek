import 'dart:js';

import 'package:flutter/material.dart';
import 'package:moduleprojekt/navigation.dart';

class InformacjePage extends StatelessWidget {
  const InformacjePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Informacje o Płatnościach'),
      ),
      drawer: WidgetNavigation('KowalXD','TomaszKowalski'),
      body: Container(
        color: Colors.teal,
        height: h,
        child: Stack(
          children: [
            _headSection(),
            _listBills(w),
          ],
        ),
      ),
    );
  }
  Widget _headSection(){
    return Container(
      height: 310,
      color: Colors.teal,
      child: Stack(
        children: [
            _mainBackground(),
            _buttonContainer(),
        ],
      ),
    );
  }
  Widget _mainBackground(){
    return Positioned(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "images/b.png",
            ),
          ),
        ),
      ),
    );
  }
  Widget _buttonContainer(){
    return Column(
      children: <Widget>[
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
          child: FloatingActionButton(
            onPressed: () =>{},
            child: Icon(Icons.mode_edit_outline_outlined, size: 30.0),
          ),
        ),
      ],
    );
  }
  Widget _listBills(w){
    return Positioned(
      top: 320,
      child: Container(
        height: 100,
        width: w-20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white54,
              offset: Offset(1,1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 10,left: 18),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 3,
                            color: Colors.grey,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "images/logo.png",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Google Pay",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.teal,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "ID:192567856",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedText(text: "Automatyczna płatność dnia 25.11.2022",color: Colors.black),
                  const SizedBox(height: 5)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SizedText extends StatelessWidget {
  final String text;
  final Color color;

  const SizedText({Key? key,required this.text,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: color,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }
}
