import 'package:flutter/material.dart';
import 'package:patientaid/Model/Appointment.dart';
import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/screens/Patient/PatientAppointment/PickAppointment_viewMoel.dart';
import 'package:patientaid/screens/Patient/PatientAppointment/null_appointments.dart';

import '../../../view.dart';
import 'Body.dart';
import 'PickAppointment_viewMoel.dart';
import 'bar.dart';

class PatientRecordsScreen extends StatefulWidget {
  // PatientAppointmentScreen({Key key}) : super(key: key);
  int index;
  PatientRecordsScreen(this.index);

  @override
  _PatientRecordsScreenState createState() => _PatientRecordsScreenState();
}

class _PatientRecordsScreenState extends State<PatientRecordsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
          child: Scaffold(
            backgroundColor:Colors.brown[200],
        appBar: Bar(),
        body: (widget.index == 0)
            ? ConsumerView<AppointmentViewmdeol>(
                initViewmodel: (appointmentsViewmodel) => appointmentsViewmodel
                    .user = dependency<LoginViewmodel>().user,
                builder: (context, appointmentsViewmodel, __) {
                  final appointments = appointmentsViewmodel.appointment;
                  if (appointments == null) return NullAppointments();
                  return Body(appointments, appointmentsViewmodel);
                },
              )
            : View<AppointmentViewmdeol>(
                initViewmodel: (appointmentsViewmodel) =>
                    dependency<AppointmentViewmdeol>().getAppoinment(),
                builder: (context, appointmentsViewmodel, __) {
                  final appointments = appointmentsViewmodel.appointments;
                  if (appointments == null) return NullAppointments();
                  return Body(appointments, appointmentsViewmodel);
                }),
        // floatingActionButton: FloatingActionButton(
        //     child: Icon(Icons.add),
        //     onPressed: () => Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => HospitalListViewScreen()
        // ))
      )),
    );
  }
}
