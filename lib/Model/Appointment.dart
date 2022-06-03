import 'package:flutter/material.dart';

import 'Doctor.dart';

class Appointment {
  dynamic id;
  String times;
  dynamic doctorid;
  String hospitalName;
  dynamic userId;
  DateTime day;
  List<TimeOfDay> date;
  bool isSelected;
  bool disapprove;
  bool approve;
  String name;
  bool isDone;

  Appointment(
      {this.id,
      this.name = "",
      this.approve = false,
      this.disapprove = true,
      this.hospitalName = "",
      this.doctorid,
      this.userId,
      this.day = null,
      this.date = null,
      this.isSelected = false,
      this.isDone = false});
// Appointment.copy(Appointment from ):this(from.time , from.hospitalName,Doctor.copy(from.doctor) );
  Appointment.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          approve: json['approve'],
          disapprove: json['disapprove'],
          hospitalName: json['hospitalName'],
          doctorid: json['doctorId'],
          userId: json['userId'],
          day: DateTime.parse(json['day']),
          // date: json['date'],
          // isSelected: json['isSelected'],
          // isDone: json['isDone'],
        );
  Map<String, dynamic> toJson() => {
        // 'id': id,
        'name': name,
        'approve': approve,
        'disapprove': disapprove,
        'hospitalName': hospitalName,
        'docotorId': doctorid,
        'userId': userId,
        'day': day.toString(),
        // 'date': date,
        // 'isSelected': isSelected,
        // 'isDone': isDone
      };
}