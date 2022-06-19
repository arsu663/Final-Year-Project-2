import 'package:patientaid/Model/Parient.dart';

class Doctor implements AbstractUser {
  dynamic id;
  dynamic hospitalId;
  String name;
  String firstName;
  String lastName;
  String gender;
  String email;
  String password;
  String specialty;
  String imageURL;
  String imagePath;
  String prefix;
  num rank;
  String medicalEducation;
  String residency;
  String internship;
  String fellowship;
  String biography;
  bool availability;

  Doctor(
      this.id,
      this.hospitalId,
      this.name,
      this.firstName,
      this.lastName,
      this.gender,
      this.email,
      this.password,
      this.specialty,
      this.imageURL,
      this.imagePath,
      this.prefix,
      this.rank,
      this.medicalEducation,
      this.residency,
      this.internship,
      this.fellowship,
      this.biography,this.availability
      );

  Doctor.copy(Doctor from)
      : this(
            from.id,
            from.hospitalId,
            from.name,
            from.firstName,
            from.lastName,
            from.gender,
            from.email,
            from.password,
            from.specialty,
            from.imageURL,
            from.imagePath,
            from.prefix,
            from.rank,
            from.medicalEducation,
            from.residency,
            from.internship,
            from.fellowship,
            from.biography,
            from.availability);

  Doctor.fromJson(Map<String, dynamic> json)
      : this(
            json['id'],
            json['hospitalId'],
            json['name'],
            json['lastName'],
            json['firstName'],
            json['gender'],
            json['email'],
            json['password'],
            json['specialty'],
            json['imageURL'],
            json['imagePath'],
            json['prefix'],
            json['rank'],
            json['medicalEducation'],
            json['residency'],
            json['internship'],
            json['fellowship'],
            json['biography'],
            json['availability']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'hospitalId': hospitalId,
        'name': name,
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'email': email,
        'password': password,
        'specialty': specialty,
        'imageURL': imageURL,
        'imagePath': imagePath,
        'prefix': prefix,
        'rank': rank,
        'medicalEducation': medicalEducation,
        'residency': residency,
        'internship': internship,
        'fellowship': fellowship,
        'biography': biography,
        'availability':availability
      };
}
