import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moduleprojekt/modele/uzytkownik.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class Autoryzacja {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Uzytkownik? _userFromFirebaseUser(User? U) {
    return U != null ? Uzytkownik(uid: U.uid) : null;
  }

  Stream <Uzytkownik?> get u {
    return _auth.authStateChanges().map((event,) {
      return _userFromFirebaseUser(event);
    });
  }
  Future logowanieHasloEmail(String emailAddress,String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Future rejestracjaHasloEmail(String emailAddress,String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future rejestracjakontadobazy(String emailAddress) async{
    final User? user = _auth.currentUser;
    final uid = user?.uid;
    try{
      return await FirebaseFirestore.instance.collection("user").doc(uid).set({
        "email":emailAddress
      });
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  // sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){

    }
  }

}