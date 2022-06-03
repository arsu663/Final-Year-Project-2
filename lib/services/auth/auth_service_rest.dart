import '../../app/main_dependencies.dart';

class AuthServiceRest implements AuthService {
  RestService get rest => dependency();

  Future<User> authenticateUser({String login, String password}) async {
    final json = await rest.get('users?email=$login&&password=$password');
    if (json == null || json.length == 0) return null;

    final _user = User.fromJson(json[0]);
    return _user;
  }

  Future<User> addUser(user) async {
    await rest.post("users", data: user);
    print("done");
  }

  Future<User> updateUser(user) async {
    final json = await rest.put("users/${user.id}", data: user);
    return User.fromJson(json);
    //  print("update");
  }

  Future<Doctor> authenticateDctor({String login, String password}) async {
    final json = await rest.get('doctors?name=$login&&password=$password');
    if (json == null || json.length == 0) return null;

    final _dr = Doctor.fromJson(json[0]);
    return _dr;
  }

  Future<String> checkUserType({String login, String password}) {
    return null;
  }
}
