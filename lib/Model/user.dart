import 'package:patientaid/Model/Parient.dart';

class User implements AbstractUser {
  dynamic _id;
  String _name;
  String _login;
  String _password;
  String _email;
  String _phoneNumber;
  String _photo;
  DateTime _appointment;
  bool hasAppointment;

  get id => _id;
  set id(value) => _id = value;
  get photo => _photo;
  set photo(value) => _photo = value;

  get name => _name;
  set name(value) => _name = value;

  get login => _login;
  set login(value) => _login = value;

  get password => _password;
  set password(value) => _password = value;

  get email => _email;
  set email(value) => _email = value;

  get phoneNumber => _phoneNumber;
  set phoneNumber(value) => _phoneNumber = value;

  get appointment => _appointment;
  set appointment(value) => _appointment = value;
  // get imageSrc => _imageSrc;
  // set imageSrc(value) => _imageSrc = value;

  User({
    dynamic id,
    String name = '',
    String photoUrl = 'assets/mathew.png',
    String login = '',
    String password = '',
    String email = "",
    String phoneNumber = "",
    DateTime appointment,
    this.hasAppointment = false,
  })  : _id = id,
        _name = name,
        _login = login,
        _password = password,
        _email = email,
        _phoneNumber = phoneNumber,
        _photo = photoUrl,
        _appointment = appointment;

  User.copy(User from)
      : this(
          id: from.id,
          name: from.name,
          login: from.login,
          password: from.password,
          email: from.email,
          phoneNumber: from.phoneNumber,
          photoUrl: from._photo,
          appointment: from.appointment,
          hasAppointment: from.hasAppointment,
        );

  User.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          photoUrl: json['photoUrl'],
          login: json['login'],
          password: json['password'],
          email: json['email'],
          phoneNumber: json['phoneNumber'],
          appointment: json['appointment'],
          hasAppointment: json['hasAppointment'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'login': login,
        'password': password,
        'email': email,
        'phoneNumber': phoneNumber,
        // 'imageSrc': imageSrc
        'photoUrl': photo,
        'appointment': appointment,
        'hasAppointment': hasAppointment,
      };
}
