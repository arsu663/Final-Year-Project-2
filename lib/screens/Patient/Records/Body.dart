import 'package:intl/intl.dart';
import 'package:patientaid/Model/Appointment.dart';
import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/screens/Patient/PatientAppointment/PickAppointment_viewMoel.dart';

class Body extends StatefulWidget {
  // const Body({Key key}) : super(key: key);
  List<Appointment> apps;
  AppointmentViewmdeol viewmodel;
  Body(this.apps, this.viewmodel);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Color _color = Colors.brown[600];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: RefreshWidget(
        onRefresh: widget.viewmodel.getAppoinment,
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: widget.viewmodel.appointment.length,
          itemBuilder: (BuildContext context, int index) {
            return (widget.viewmodel.appointment[index].day
                    .isBefore(DateTime.now()))
                ? Container(
                    decoration: BoxDecoration(
                      color: _color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // height: 50,

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              'Appointment #${index + 1} ',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(1),
                                  fontSize: 20),
                            ),
                            Text(
                                'Date : ' +
                                    DateFormat('yyyy-MM-dd').format(widget
                                        .viewmodel.appointment[index].day),
                                style: TextStyle(
                                    color: Colors.white.withOpacity(1),
                                    fontSize: 20)),
                            Text(
                                'Hospital : ${widget.viewmodel.appointment[index].hospitalName}',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(1),
                                    fontSize: 20)),
                            Text(
                                'Time : ${(widget.apps[index].day.hour >= 10) ? widget.apps[index].day.hour : '0' + '${widget.apps[index].day.hour}'} :${(widget.apps[index].day.minute >= 10) ? widget.apps[index].day.minute : '0' + '${widget.apps[index].day.minute}'} ',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(1),
                                    fontSize: 20)),
                          ],
                        ),
                        // onTap: () => Navigator.pushNamed(
                        //     context, "/Trackingscreen",
                        //     arguments: index),
                      ),
                    ),
                  )
                : SizedBox();
            // : Container(
            //     decoration: BoxDecoration(
            //       color: _color,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     // height: 50,

            //     child: Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: GestureDetector(
            //         child: Column(
            //           // mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.start,

            //           children: [
            //             Text(
            //               'Appointment #${index + 1} ',
            //               style: TextStyle(
            //                   color: Colors.white.withOpacity(1),
            //                   fontSize: 20),
            //             ),
            //             Text(
            //                 'Date : ' +
            //                     DateFormat('yyyy-MM-dd').format(widget
            //                         .viewmodel.appointment[index].day),
            //                 style: TextStyle(
            //                     color: Colors.white.withOpacity(1),
            //                     fontSize: 20)),
            //             Text(
            //                 'Hospital : ${widget.viewmodel.appointment[index].hospitalName}',
            //                 style: TextStyle(
            //                     color: Colors.white.withOpacity(1),
            //                     fontSize: 20)),
            //             Text(
            //                 'Time : ${widget.viewmodel.appointment[index].day.hour}:${widget.viewmodel.appointment[index].day.minute}',
            //                 style: TextStyle(
            //                     color: Colors.white.withOpacity(1),
            //                     fontSize: 20)),
            //           ],
            //         ),
            //         // onTap: () => Navigator.pushNamed(
            //         //     context, "/Trackingscreen",
            //         //     arguments: index),
            //       ),
            //     ),
            //   );
          },
          separatorBuilder: (BuildContext context, int index) =>
              (widget.viewmodel.appointment[index].day.isBefore(
            DateTime.now(),
          ))
                  ? const Divider()
                  : const Divider(
                      color: Colors.white,
                      height: 0.0,
                      thickness: 0.0,
                    ),
        ),
      ),
    );
  }
}
