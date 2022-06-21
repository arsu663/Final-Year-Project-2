// import 'package:firebase_auth/firebase_auth.dart' as fire;

// import 'package:google_sign_in/google_sign_in.dart';

// import '../app/main_dependencies.dart';

// class GoogleSignInProvider extends ChangeNotifier {
//   final googleSignIn = GoogleSignIn();

//   User _user;

//   User get user => _user;

//   Future googleLogin() async {
//     try {
//       final googleUser = await googleSignIn.signIn();

//       if (googleUser == null) return;
//       _user = googleUser as User;
//       // _user.login = googleUser.displayName;
//       // _user.id = googleUser.id;
//       // _user.photo = googleUser.photoUrl;
//       // _user.email = googleUser.email;

//       final googleAuth = await googleUser.authentication;

//       final credential = fire.GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
// try{
//     final user =  await fire.FirebaseAuth.instance.signInWithCredential(credential);
//       Controller(user).checkUser();
// }catch(e){
//   print(e.toString());
// }
//     } catch (e) {
//       print(e.toString());
//     }

//     notifyListeners();
//   }

//   Future logout() async {
//     await googleSignIn.disconnect();
//     fire.FirebaseAuth.instance.signOut();
//   }
// }
