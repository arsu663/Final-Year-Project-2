import 'package:firebase_auth/firebase_auth.dart' as fire;
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:patientaid/Model/user.dart' as u;

import 'google.dart';

class GoogleAuth implements LoginByGoogle {
  final googleSignIn = GoogleSignIn();

  u.User _user;

  u.User get user => _user;

  Future<u.User> googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null);

      _user = googleUser as u.User;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      (await FirebaseAuth.instance.signInWithCredential(credential));
      return _user;
    } catch (e) {
      print(e.toString());
    }
  }
}
