import 'package:moduleprojekt/modele/uzytkownik.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  // sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){

    }
  }

}