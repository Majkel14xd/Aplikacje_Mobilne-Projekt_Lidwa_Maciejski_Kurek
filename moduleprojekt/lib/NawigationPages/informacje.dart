import 'dart:math';
import 'package:flutter/material.dart';
import 'package:moduleprojekt/navigation.dart';

class InformacjePage extends StatefulWidget {
  @override
  _InformacjePageState createState() => _InformacjePageState();
}

class _InformacjePageState extends State<InformacjePage> {
  List<Widget> containerList = [];

  get w => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Informacje o Płatnościach'),
      ),
      drawer: WidgetNavigation(),
      body: Container(
        color: Colors.teal,
        height: h,
        child: new SingleChildScrollView(
          child: new Column(
            children: [
              new Container(
                child: _headSection(),
              ),
              SizedBox(
                height: 5,
              ),
              new Container(
                child: Column(
                  children: containerList,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonContainer() {
    return Column(
      children: <Widget>[
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, top: 8.0, right: 100),
          child: FloatingActionButton(
            onPressed: () => setState(() => containerList.add(_listBills(w))),
            child: Icon(Icons.mode_edit_outline_outlined, size: 30.0),
          ),
        ),
      ],
    );
  }

  Widget _buttonDelete() {
    return Column(
      children: <Widget>[
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, top: 8.0, left: 100),
          child: FloatingActionButton(
            onPressed: () => setState(() => containerList.removeLast()),
            child: Icon(Icons.delete_forever, size: 30.0),
          ),
        ),
      ],
    );
  }

  Widget _listBills(w) {
    final billOptions = [
      'Google Pay',
      'Apple Pay',
      'MasterCard',
      'Visa',
      'Blik'
    ];
    final selectedBillOption =

    billOptions[Random().nextInt(billOptions.length)];
=======
        billOptions[Random().nextInt(billOptions.length)];

    List<String> imagePaths = [
      "images/logo.png",
      "images/logo1.png",
      "images/logo2.png",
      "images/logo3.png"
    ];
    return Positioned(
      top: 320,
      child: Container(
        height: 100,
        width: w - 20,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white54,
              offset: Offset(1, 1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 10, left: 18),
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
                                imagePaths[Random().nextInt(imagePaths.length)],
                              ),
                            )),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedBillOption,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.teal,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "ID: ${Random().nextInt(100000000)}",
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
                  SizedText(
                      text:

                      "Automatyczna płatność dnia ${DateTime.now().toString().substring(0, 16)}",

                          "Automatyczna płatność dnia ${DateTime.now().toString().substring(0, 16)}",

                      color: Colors.black),
                  const SizedBox(height: 5)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headSection() {
    return Container(
      height: 310,
      color: Colors.teal,
      child: Stack(
        children: [
          _mainBackground(),
          _buttonContainer(),
          _buttonDelete(),
        ],
      ),
    );
  }

  Widget _mainBackground() {
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
}

class SizedText extends StatelessWidget {
  final String text;
  final Color color;

  const SizedText({Key? key, required this.text, required this.color})
      : super(key: key);

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