// import 'package:flutter/material.dart';
// import '../../app/main_dependencies.dart';

// class HospitalDetailScreen extends StatefulWidget {
//    Hospital hospital;
//   // final Doctor doctor;

//   // HospitalDetailScreen(this.hospital);

//   @override
//   _HospitalDetailScreenState createState() => _HospitalDetailScreenState();
// }

// class _HospitalDetailScreenState extends State<HospitalDetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffF0F0F0),
//       appBar: AppBar(
//         backgroundColor: HexColor("#2A2AC0"),
//         title: Text("${widget.hospital.hospitalName} Doctors Details"),
//       ),
//       body: SafeArea(
//         child: ListView.separated(
//           itemCount: widget.hospital.doctors.length,
//           itemBuilder: (context, index) => ListTile(
//             // dense: true,
//             title: Text(
//               widget.hospital.doctors[index].name,
//               style: TextStyle(fontSize: 20),
//             ),
//             // subtitle: Text(
//             //     '${widget.hospital.doctors[index].age.toString()} years old'),
//             // trailing: Text(
//             //   '${widget.hospital.doctors[index].speciality}',
//             //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             // ),
//             leading: CircleAvatar(
//               backgroundImage: NetworkImage(
//                 "${widget.hospital.doctors[index].imageURL}",
//               ),
//               radius: 40,
//             ),
//           ),
//           separatorBuilder: (context, index) => Divider(
//             color: Colors.blueGrey,
//             thickness: 0.7,
//           ),
//         ),
//       ),
//     );
//   }
// }
