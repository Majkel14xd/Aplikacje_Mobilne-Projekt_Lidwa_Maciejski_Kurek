import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moduleprojekt/navigation.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);
  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String tlo='https://cdn.pixabay.com/photo/2019/03/11/21/18/city-4049526_1280.png';
  final String picture='https://i.wpimg.pl/400x0/i.wp.pl/a/f/jpeg/34841/twarze_dwa.jpeg';
  final double coverHeight =280;
  final double profileHeight= 144;
  @override
  Widget build(BuildContext context) {

    final top = coverHeight - profileHeight/2;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      drawer: WidgetNavigation('KowalXD','TomaszKowalski'),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ProfilTop(top),
          buildContent(),
        ],
      ),
    );
  }
  Widget ProfilTop(top) {
    final bottom = profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(tlo),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(picture),
        ),
      ],
    );
  }
  Widget buildCoverImage(String tlo) =>
      Container(
        color: Colors.teal,
        child: Image.network(
          tlo,
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );
  Widget buildProfileImage(String picture) =>
      CircleAvatar(
        radius: profileHeight/2,
        backgroundColor: Colors.grey.shade700,
        backgroundImage: NetworkImage(
          picture,
        ),
      );
  Widget buildContent()=>
      Column(
        children: [
          const SizedBox(height: 8),
          Text(
            _auth.currentUser!.displayName.toString(),
            style: TextStyle(fontSize: 28),
          ),
          const SizedBox(height: 8),
          Text(
            _auth.currentUser!.email.toString(),
            style: TextStyle(fontSize: 20,color: Colors.black),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildIcon(Icons.gif),
              const SizedBox(width: 12),
              buildIcon(Icons.web),
              const SizedBox(width: 12),
              buildIcon(Icons.phone),
              const SizedBox(width: 12),
            ],
          ),
          const SizedBox(height: 16),
          Divider(),
          const SizedBox(height: 16),
          buildAbout(),
          const SizedBox(height: 32),
        ],
      );
 Future<String> pobierzopis() async {
    String opis = await FirebaseFirestore.instance
        .collection('user')
        .doc(_auth.currentUser!.uid.toString())
        .get()
        .then((value) {
      return value.data()!['about']; // Access your after your get the data
    });
    return opis;
  }
  Widget buildAbout() {
    return FutureBuilder(
      future: pobierzopis(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: TextStyle(fontSize: 28),
                ),
                const SizedBox(height: 16),
                Text(
                  snapshot.requireData,
                  style: TextStyle(fontSize: 18,height: 1.4),
                ),
              ],
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget buildIcon(IconData icon) =>
      CircleAvatar(
        radius: 25,
        child: Center(child: Icon(icon,size: 28)),
      );
}
