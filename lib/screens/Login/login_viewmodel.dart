import 'package:patientaid/Model/Parient.dart';
import 'package:patientaid/services/doctor/doctor_servcie.dart';

import '../../app/main_dependencies.dart';

class LoginViewmodel extends Viewmodel {
  get _service => dependency<AuthService>();
  User _user = User();
  bool _showPassword = false;
  bool _showErrorMessage = false;
  Doctor _dr;
  dynamic userId;
  String _email;
  String _password;

  get user => _user;
  set user(value) => _user = value;

  get dr => _dr;
  set dr(value) => _dr = value;

  get showPassword => _showPassword;
  set showPassword(value) {
    turnBusy();
    _showPassword = value;
    turnIdle();
  }

  get username => _user.email;
  set username(value) {
    turnBusy();
    _showErrorMessage = false;
    _email = value;
    turnIdle();
  }

  get password => _user.password;
  set password(value) {
    turnBusy();
    _showErrorMessage = false;
    _password = value;
    turnIdle();
  }

  bool get showErrorMessage {
    return _showErrorMessage;
  }

  set showErrorMessage(value) {
    turnBusy();
    _showErrorMessage = value;
    turnIdle();
  }

  // Future<AbstractUser> authenticate(String username, String password) async {
  //   turnBusy();
  //   print(username + password);

  //   _user = await _service.authenticateUser(login: _email, password: _password);

  //   if (_user == null) {
  //     _dr =
  //         await _service.authenticateDctor(login: _email, password: _password);
  //   }
  //   if ((_user == null) && (_dr == null)) _showErrorMessage = true;
  //   turnIdle();
  //   // return _user;
  // }

  Future<AbstractUser> login() async {
    turnBusy();
    final AbstractUser _user =
        await _service.authenticateUser(login: _email, password: _password);
    // if (_user == null) _showErrorMessage = true;
    turnIdle();
    return _user;
  }

  Future<AbstractUser> checkType() async {
    turnBusy();
    final AbstractUser _doctor =
        await _service.authenticateDctor(login: _email, password: _password);
    // if (_doctor == null) _showErrorMessage = true;
    user = null;
    turnIdle();
    return _doctor;
  }

  Future<User> updateUser(User user2) async {
    turnBusy();

    final u = await _service.updateUser(user2);
    _user = u;
    turnIdle();
    return _user;
  }

  Future<Doctor> updatedr(Doctor dr) async {
    turnBusy();
    final d = await dependency<DoctorService>().updateDoctor(dr);

    _dr = d;
    turnIdle();
    return _dr;
  }
}
