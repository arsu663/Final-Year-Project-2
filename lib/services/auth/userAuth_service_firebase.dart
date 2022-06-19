// import 'dart:math';

// import 'package:patientaid/Model/Parient.dart';

// import '../../app/main_dependencies.dart';

// // class UserAuthServiceFirebase implements AuthService {
// class UserAuthServiceFirebase implements AuthService {
//   RestService get rest => dependency();

//   Future<AbstractUser> authenticateUser({String login, String password}) async {
//     try {
//       final json = await rest
//           .post('auths/signin', data: {'email': login, 'password': password});

//       if (json == null) return null;

//       // Pre-process json data to comply with the field of the User model
//       // json['id'] = json['localId'];
//       // json['name'] = json['displayName'];
//       // json['photo'] = json['profilePicture'];
//       final _user = await rest.get("users/${json['localId']}");
//       // Get the access token and let the rest object stores that
//       // rest.openSession(json['idToken']);
//       // final _user = User.fromJson(json);
//       if (_user != null && _user.length != 0) {
//         print(_user.toString());
//         return User.fromJson(_user);
//       } else {
//         return null;
//       }
//     } catch (e) {
//       return null;
//     }
//   }

//   Future<User> addUser(user) async {
//     final json = await rest.post('auths/signup', data: user);

//     if (json == null) return null;

//     json['id'] = json['localId'];
//     json['name'] = user.name;
//     json['password'] = user.password;
//     json['phoneNumber'] = user.phoneNumber;
//     json['photoUrl'] = user.photo;
//     json['hasAppointment'] = user.hasAppointment;
//     json['login'] = user.login;
//     json['appointment'] = user.appointment;

//     print("done");

//     final _user = User.fromJson(json);
//     await rest.post("users", data: _user);
//     return _user;
//   }

//   Future<User> updateUser(user) async {
//     final json = await rest.put("users/${user.id}", data: user);
//     return User.fromJson(json);
//     //  print("update");
//   }

//   Future<Doctor> authenticateDctor({String login, String password}) async {
//     try {
//       final json = await rest
//           .post('auths/signin', data: {'email': login, 'password': password});

//       if (json == null) return null;

//       // Pre-process json data to comply with the field of the User model
//       // json['id'] = json['localId'];
//       // json['name'] = json['displayName'];
//       // json['photo'] = json['profilePicture'];
//       final _doctor = await rest.get("doctors/${json['localId']}");
//       // Get the access token and let the rest object stores that
//       // rest.openSession(json['idToken']);
//       // final _user = User.fromJson(json);
//       // print(_user.toString());
//       if (_doctor != null && _doctor.length != 0) {
//         return Doctor.fromJson(_doctor);
//       } else {
//         return null;
//       }
//     } catch (e) {
//       return null;
//     }
//   }

//   Future<String> checkUserType({String login, String password}) async {
//     // try {
//     //   final json = await rest
//     //       .post('auths/signin', data: {'email': login, 'password': password});

//     //   if (json == null) return null;

//     //   final _doctor = await rest.get("doctors/${json['localId']}");
//     //   if (_doctor != null && _doctor.length != 0) {
//     //     return "doctor";
//     //   }
//     //   return "user";
//     // } catch (e) {
//     return null;
//     // }
//   }

//   // Future<void> signout() async => rest.closeSession();
// }
