import 'package:intl/intl.dart';
import 'package:patientaid/Model/Appointment.dart';
import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/screens/Doctor/Doctor%20Profile/doctor_viewmodel.dart';
import 'package:provider/provider.dart';

import 'PickAppointment_viewMoel.dart';

class Body extends StatefulWidget {
  // const Body({Key key}) : super(key: key);
  List<Appointment> apps;
  AppointmentViewmdeol viewmodel;
  String name;
  Body(this.apps, this.viewmodel, {this.name});

  @override
  _BodyState createState() => _BodyState();
}

// IconButton(
//                                     onPressed: () =>
//                                         Navigator.pushReplacementNamed(
//                                             context,
//                                             "/PatientDashboardScreen"),
//                                     icon: Icon(Icons.arrow_back))

class _BodyState extends State<Body> {
  Color _color = Colors.brown[200];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: RefreshWidget(
        onRefresh: widget.viewmodel.getAppoinment,
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: widget.apps.length,
          itemBuilder: (BuildContext context, int index) {
            // print(doctor);
            return SingleChildScrollView(
                child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(10),
              ),
              // height: 50,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: (widget.viewmodel.user != null)
                    ? GestureDetector(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              'Appointment #${index + 1} ',
                              style: TextStyle(
                                color: Colors.brown[900],
                                fontSize: 20,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Date : ' +
                                  DateFormat('yyyy-MM-dd')
                                      .format(widget.apps[index].day),
                              style: TextStyle(
                                color: Colors.brown[900],
                                fontSize: 20,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Hospital : ${widget.apps[index].hospitalName}',
                              style: TextStyle(
                                color: Colors.brown[900],
                                fontSize: 20,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Doctor : ${widget.apps[index].drName}',
                              style: TextStyle(
                                color: Colors.brown[900],
                                fontSize: 20,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Time : ${(widget.apps[index].day.hour >= 10) ? widget.apps[index].day.hour : '0' + '${widget.apps[index].day.hour}'}:${(widget.apps[index].day.minute >= 10) ? widget.apps[index].day.minute : '0' + '${widget.apps[index].day.minute}'} ',
                              style: TextStyle(
                                color: Colors.brown[900],
                                fontSize: 20,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        onTap: () => Navigator.pushNamed(
                            context, "/Trackingscreen",
                            arguments: index),
                      )
                    : ((widget.apps[index].disapprove == true &&
                                widget.apps[index].approve == false) ||
                            (widget.apps[index].disapprove == false &&
                                widget.apps[index].approve == true))
                        ? GestureDetector(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  'appointment #${index + 1} ',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(1),
                                      fontSize: 20),
                                ),
                                Text(
                                    'Date : ' +
                                        DateFormat('yyyy-MM-dd')
                                            .format(widget.apps[index].day),
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(1),
                                        fontSize: 20)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                        'Time : ${(widget.apps[index].day.hour >= 10) ? widget.apps[index].day.hour : '0' + '${widget.apps[index].day.hour}'}:${(widget.apps[index].day.minute >= 10) ? widget.apps[index].day.minute : '0' + '${widget.apps[index].day.minute}'} ',
                                        style: TextStyle(
                                            color: Colors.white.withOpacity(1),
                                            fontSize: 20)),
                                    Column(
                                      children: [
                                        Icon(Icons.error, size: 15),
                                        Text(
                                          'Requires Approval',
                                          style: TextStyle(fontSize: 14),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            onTap: () => {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    elevation: 16,
                                    child: Container(
                                      height: 200.0,
                                      width: 200.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              'Date : ' +
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(widget
                                                          .apps[index].day),
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(1),
                                                  fontSize: 20)),
                                          Text(
                                              'Time : ${(widget.apps[index].day.hour >= 10) ? widget.apps[index].day.hour : '0' + '${widget.apps[index].day.hour}'}:${(widget.apps[index].day.minute >= 10) ? widget.apps[index].day.minute : '0' + '${widget.apps[index].day.minute}'} ',
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(1),
                                                  fontSize: 20)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () => {
                                                  widget.apps[index].approve =
                                                      true,
                                                  widget.viewmodel
                                                      .updateAppoinmtent(
                                                    widget.apps[index],
                                                  ),
                                                  setState(() {})
                                                },
                                                child: Text("approve"),
                                              ),
                                              ElevatedButton(
                                                onPressed: () => {
                                                  Navigator.of(context).pop()
                                                  // widget.apps[index]
                                                  //     .disapprove = false,
                                                  // widget.viewmodel
                                                  //     .updateAppoinmtent(
                                                  //   widget.apps[index],
                                                  // ),
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.red),
                                                ),
                                                child: Text("Disapprove"),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            },
                          )
                        : Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                'appointment #${index + 1} ',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(1),
                                    fontSize: 20),
                              ),
                              Text(
                                  'Date : ' +
                                      DateFormat('yyyy-MM-dd')
                                          .format(widget.apps[index].day),
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(1),
                                      fontSize: 20)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                      'Time : ${(widget.apps[index].day.hour >= 10) ? widget.apps[index].day.hour : '0' + '${widget.apps[index].day.hour}'}:${(widget.apps[index].day.minute >= 10) ? widget.apps[index].day.minute : '0' + '${widget.apps[index].day.minute}'} ',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(1),
                                          fontSize: 20)),
                                  Column(
                                    children: [
                                      Icon(Icons.check, size: 17),
                                      Text(
                                        'Approved',
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
              ),
            ));
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
