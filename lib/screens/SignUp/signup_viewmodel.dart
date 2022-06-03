import '../../app/main_dependencies.dart';

class SignupViewModel extends Viewmodel {
  SignupViewModel();
  // also concrete class
  AuthService get dataService => dependency();
  User _user;
  User get user => _user;
  set user(value) => _user = value;
  
  Future<void> addUser(User user) async {
    turnBusy();
    if (user == null) return;
    final state = dataService.addUser(user);

    turnIdle();
  }

  // Future<bool> checkForDuplicity(User user) async {
  //   turnBusy();

  //   final users = await getUsers();
  //   bool duplicate = false;
  //   if (users != null) {
  //     users.forEach((_user) {
  //       if (_user.email == user.email) {
  //         turnIdle();
  //         duplicate = true;
  //         return duplicate;
  //       }
  //     });
  //   } else {
  //     turnIdle();
  //     return duplicate;
  //   }
  //   turnIdle();
  //   return duplicate;
  // }

  // Future<List<User>> getUsers() async {
  //   turnBusy();
  //   turnIdle();
  //   final users = await dataService.();
  //   return users;
  // }
}
