import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/screens/Patient/PatientAppointment/null_appointments.dart';

import 'Body.dart';
import 'PickAppointment_viewMoel.dart';
import 'bar.dart';

class PatientAppointmentScreen extends StatefulWidget {
  // PatientAppointmentScreen({Key key}) : super(key: key);
  final int index;
  final String doctorname;
  PatientAppointmentScreen(this.index, {this.doctorname});

  @override
  _PatientAppointmentScreenState createState() =>
      _PatientAppointmentScreenState();
}

class _PatientAppointmentScreenState extends State<PatientAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.brown[600],
            appBar: Bar(),
            body: (widget.index == 0)
                ? ConsumerView<AppointmentViewmdeol>(
                    initViewmodel: (appointmentsViewmodel) =>
                        appointmentsViewmodel.user =
                            dependency<LoginViewmodel>().user,
                    builder: (context, appointmentsViewmodel, __) {
                      final appointments = appointmentsViewmodel.appointment;
                      if (appointments == null) return NullAppointments();
                      return Body(appointments, appointmentsViewmodel,
                          name: widget.doctorname);
                    })
                : View<AppointmentViewmdeol>(
                    initViewmodel: (appointmentsViewmodel) =>
                        dependency<AppointmentViewmdeol>().recodedApps(),
                    builder: (context, appointmentsViewmodel, __) {
                      final appointments = appointmentsViewmodel.recorded;
                      if (appointments == null) return NullAppointments();
                      return Body(appointments, appointmentsViewmodel);
                    },
                  ),
            floatingActionButton: Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.bottomRight,
                    child: View<AppointmentViewmdeol>(
                      initViewmodel: (appointmentsViewmodel) =>
                          appointmentsViewmodel.user =
                              dependency<LoginViewmodel>().user,
                      builder: (context, appointmentsViewmodel, ___) {
                        if (appointmentsViewmodel.user != null) {
                          return FloatingActionButton(
                            backgroundColor: Colors.brown[200],
                            child:
                                Icon(Icons.add, color: Colors.white, size: 40),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HospitalListViewScreen(),
                              ),
                            ),
                          );
                        }
                        return Container();
                      },
                    )),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 40),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey,
                      border: Border.all(),
                    ),
                    // padding: const EdgeInsets.all(20.0),
                    child: View<AppointmentViewmdeol>(
                      initViewmodel: (appointmentsViewmodel) =>
                          appointmentsViewmodel.user =
                              dependency<LoginViewmodel>().user,
                      builder: (context, appointmentsViewmodel, ___) {
                        if (appointmentsViewmodel.user != null) {
                          return IconButton(
                            onPressed: () => Navigator.pushReplacementNamed(
                                context, "/PatientDashboardScreen"),
                            icon: Icon(Icons.arrow_back),
                            color: Colors.white,
                          );
                        }
                        return IconButton(
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, "/DoctorDashboardScreen"),
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                        );
                      },
                    ),
                  ),
                ),
              ],
            )

            // builder: (context,appointmentsViewmodel, ___)=> {
            //   if (appointmentsViewmodel.user != null){

            //   }
            //      return FloatingActionButton(
            //         child: Icon(Icons.add),
            //         onPressed: () => Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) =>
            //                     HospitalListViewScreen())));
            // },
            ),
      ),
    );
  }
}
