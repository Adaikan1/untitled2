import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled2/login_page.dart';
import 'package:untitled2/navigationbar.dart';

var authService = AuthService();
class AuthService{
  final GoogleSignIn googleUser = GoogleSignIn(
  scopes: <String>["email"]);

  signInWithGoogle() async {
   
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() {
    googleUser.signOut();
    FirebaseAuth.instance.signOut();
  }

  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return NavigationPage();
        } else {
          return const LoginPage();
        }
      }
    );
  }
}