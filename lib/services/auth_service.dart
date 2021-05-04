
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_alfabank/modules/usuario.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<Usuario> get user {
    return this._auth.authStateChanges()
        .map(
          (User firebaseUser) =>_firebaseUserToUsuario(firebaseUser)
        );
  }

  Usuario _firebaseUserToUsuario(User firebaseUser) {
    return  (firebaseUser !=null) ? Usuario(uid: firebaseUser.uid) : null;
  }

  /*Sing anon*/
  Future<User> singInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      return userCredential.user;

    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  /*Sing with email and pass*/
  Future singInRegisteredUser(String email, String password) async {
    try {

      UserCredential user = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return this._firebaseUserToUsuario(user.user);

    } catch(e) {
      print(e.toString());
      return null;
    }
  }


  /*Register wight email and pass*/
  Future<Usuario> registerWithEmailAndPassword(String email, String pass) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: pass);

      final user = userCredential.user;
      return _firebaseUserToUsuario(user);

    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  /*sing out*/
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}