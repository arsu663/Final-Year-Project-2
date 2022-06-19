import 'package:patientaid/Model/Parient.dart';
import 'package:patientaid/app/main_dependencies.dart';

abstract class AuthService {
  Future<AbstractUser> authenticateUser({String login, String password});
  Future<Doctor> authenticateDctor({String login, String password});
  Future<Doctor> authenticateDoctor({String login, String password});
  Future<String> checkUserType({String login, String password});
  Future<void> addUser(User user);
  Future<User> updateUser(User user);
}
