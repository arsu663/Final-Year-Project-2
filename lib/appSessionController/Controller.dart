// import 'package:firebase_auth/firebase_auth.dart';

// import '../app/main_dependencies.dart';

// class Controller {
//   UserCredential u;
//   Controller(UserCredential u);
//   void checkUser(){
//     if(u.user == null){
//        Center(child: CircularProgressIndicator());
//     }else{
//       PatientDashboardScreen();
//     }
//   }
  
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//       // body: StreamBuilder(
//       //     stream: FirebaseAuth.instance.authStateChanges(),
//       //     builder: (context, snapshot) {
//       //       if (u.user == ConnectionState.waiting) {
//       //         return Center(child: CircularProgressIndicator());
//       //       } else if (snapshot.hasError) {
//       //         return Center(
//       //             child: Text('Something Went Wrong' + snapshot.error));
//       //       } else if (snapshot.hasData) {
//       //         return PatientDashboardScreen();
//       //       } else {
//       //         return SignUpScreen();
//       //       }
//           // }),
         
//     // );
//   // }
// }
