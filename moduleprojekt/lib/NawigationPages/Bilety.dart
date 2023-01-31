import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_flutter/qr_flutter.dart';
class BiletyPage extends StatefulWidget {
  @override
  _BiletyPageState createState() => _BiletyPageState();
}

class _BiletyPageState extends State<BiletyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bilety dostepne w aplikacji'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Bilety').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              if (document != null) {
                return ListTile(
                  title: Text('Przeowznik: ${document['Przewoznik']}'),
                  subtitle: Text(
                      'Odjazd: ${document['Godzina_odjazdu']} / Przyjazd: ${document['Godzina_przyjazdu']} Cena: ${document['Cena_biletu'].toString()} zł'),
                  trailing: Text(document['Rodzaj_transportu']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlatnoscPage(
                            document: document,
                            cena: document['Cena_biletu'].toString()),
                      ),
                    );
                  },
                );
              }
              return Container();
            },
          );
        },
      ),
    );
  }
}

class PlatnoscPage extends StatelessWidget {
  PlatnoscPage({required this.document, required this.cena});
  final DocumentSnapshot document;
  final String cena;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Platnosc biletu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Potwierdzenie zakupu biletu'),
            Text('Przewoznik: ${document['Przewoznik']}'),
            Text('Cena biletu: $cena zł'),
            QrImage(
              data: '${document.id}',
              size: 200,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Potwierdz platnosc'),
            ),
          ],
        ),
      ),
    );
  }
}