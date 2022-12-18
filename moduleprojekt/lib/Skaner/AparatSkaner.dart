import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';



class AparatSkaner extends StatefulWidget {
  const AparatSkaner({Key? key}) : super(key: key);


  @override
  State<AparatSkaner> createState() => _AparatSkaner();
}

class _AparatSkaner extends State<AparatSkaner> {
  final GlobalKey _gLobalkey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  var result;
  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;
      });
      controller.resumeCamera();
      controller.dispose();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 400,
              width: 400,
              child: QRView(
                  key: _gLobalkey,
                  onQRViewCreated: qr,
                overlay: QrScannerOverlayShape(
                borderColor: Colors.green,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 250,
              ),
              ),
            ),
            Center(
              child: (result !=null) ? Text('${result!.code}') : Text('Skanuj bilet z kodu QR'),
            ),
          ],
        ),
      ),
    );
  }
}