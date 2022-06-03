// import 'package:patientaid/Model/Appointment.dart';
import 'package:flutter/material.dart';
import 'package:patientaid/Model/Appointment.dart';
// import 'package:patientaid/Model/Parient.dart';

// import 'doctor.dart';

// final patients = <Appointment>[
//   Appointment(
//     1,
//     "skudia",
//     Doctor(
//         "abdalla",
//         'Abdalla Mahmoud',
//         'Amin',
//         'Male',
//         'abdalla@gmail.com',
//         'specialty',
//         'assets/dr.jpg',
//         'assets/profile.jpg',
//         'prefix',
//         3.25,
//         'medicalEducation',
//         'residency',
//         'internship',
//         'fellowship',
//         'biography'),
//   ),
//   Appointment(
//     2,
//     "skudia",
//     Doctor(
//         "omar",
//         'Omar Mohamed',
//         'Eltablawy',
//         'Male',
//         'omar@gmail.com',
//         'specialty',
//         'assets/dr.jpg',
//         'assets/profile.jpg',
//         'prefix',
//         3.25,
//         'medicalEducation',
//         'residency',
//         'internship',
//         'fellowship',
//         'biography'),
//   ),
//   Appointment(
//     3,
//     "skudia",
//     Doctor(
//         "Arsu",
//         'Mohamed Arslan',
//         'lastName',
//         'Male',
//         'Arsu@gmail.com',
//         'specialty',
//         'assets/dr.jpg',
//         'assets/profile.jpg',
//         'prefix',
//         3.25,
//         'medicalEducation',
//         'residency',
//         'internship',
//         'fellowship',
//         'biography'),
//   ),
//   Appointment(
//     4,
//     "skudia",
//     Doctor(
//         "Ali",
//         'Ali Hamed',
//         'lastName',
//         'Male',
//         'ali@gmail.com',
//         'specialty',
//         'assets/dr.jpg',
//         'assets/profile.jpg',
//         'prefix',
//         3.25,
//         'medicalEducation',
//         'residency',
//         'internship',
//         'fellowship',
//         'biography'),
//   )
// ];

List<Appointment> appointmentstoselect = [
  Appointment(
    day: DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
    date: [
      TimeOfDay(hour: 13, minute: 00),
      TimeOfDay(hour: 09, minute: 30),
      TimeOfDay(hour: 10, minute: 00),
      TimeOfDay(hour: 10, minute: 30),
      TimeOfDay(hour: 11, minute: 00),
      TimeOfDay(hour: 11, minute: 30),
      TimeOfDay(hour: 12, minute: 00),
    ],
  ),
  Appointment(
    day: DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 2),
    date: [
      TimeOfDay(hour: 09, minute: 00),
      TimeOfDay(hour: 13, minute: 30),
      TimeOfDay(hour: 10, minute: 00),
      TimeOfDay(hour: 10, minute: 30),
      TimeOfDay(hour: 11, minute: 00),
      TimeOfDay(hour: 11, minute: 30),
      TimeOfDay(hour: 12, minute: 00),
    ],
  ),
  Appointment(
    day: DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 3),
    date: [
      TimeOfDay(hour: 09, minute: 00),
      TimeOfDay(hour: 09, minute: 30),
      TimeOfDay(hour: 10, minute: 00),
      TimeOfDay(hour: 10, minute: 30),
      TimeOfDay(hour: 11, minute: 00),
      TimeOfDay(hour: 11, minute: 30),
      TimeOfDay(hour: 12, minute: 00),
    ],
  ),
];
