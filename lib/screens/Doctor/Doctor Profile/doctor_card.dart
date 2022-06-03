import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:patientaid/Model/Appointment.dart';
import 'package:patientaid/Model/Doctor.dart';
import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/screens/Hospital/HospitalList/hospital_viewmodel.dart';

import 'doctor_viewmodel.dart';
import 'widgets.dart';
import 'package:mailer/mailer.dart';
// import '../app/main_dependencies.dart';
import 'package:mailer/smtp_server.dart';

class DoctorCard extends StatefulWidget {
  // Googleserver server  ;
  Doctor doctorInfo;
  DoctorProfileviewModel viewmodel;
  DoctorCard({@required this.doctorInfo, this.viewmodel});

  @override
  _DoctorCardState createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    bool isDone = false;
    Appointment selectedAppointment = Appointment();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Color _color = Colors.brown[100];
    return Stack(
      children: <Widget>[
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 15.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: Colors.brown[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20.0,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FloatButton(
                            icon: Icon(Icons.phone, size: 30), title: 'Office'),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 15.0,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              transform:
                                  Matrix4.translationValues(0.0, -15.0, 0.0),
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage:
                                    NetworkImage(widget.doctorInfo.imagePath),
                              ),
                            ),
                          ],
                        ),
                        FloatButton(
                          icon: Icon(Icons.message_outlined, size: 30),
                          title: 'Message',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 15.0,
                      bottom: 5.0,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            widget.doctorInfo.firstName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              widget.doctorInfo.specialty ??
                                  "specialty not found",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Center(
                  //   child: Align(
                  //     alignment: Alignment.center,
                  //     child: StarRating(
                  //         // rating: widget.doctorInfo.rank
                  //         ),
                  //   ),
                  // ),
                  BiographySection(
                    biography: widget.doctorInfo.biography,
                    edit: false,
                  ),
                  PhysicianHistorySection(
                    physicianInfo: [
                      PhysicianHistoryColumn(
                        physicianInfo: [
                          BasicInfo(
                              title: 'MEDICAL EDUCATION',
                              info: widget.doctorInfo.medicalEducation),
                          BasicInfo(
                            title: 'INTERNSHIP',
                            info: widget.doctorInfo.internship,
                            margin: EdgeInsets.only(top: 20.0),
                          )
                        ],
                      ),
                      PhysicianHistoryColumn(
                        physicianInfo: [
                          BasicInfo(
                              title: 'RESIDENCY',
                              info: widget.doctorInfo.residency),
                          BasicInfo(
                            title: 'FELLOWSHIP',
                            info: widget.doctorInfo.fellowship,
                            margin: EdgeInsets.only(top: 20.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // AppointemntsSection(widget.viewmodel),
                  SectionTitle(title: "Appointments"),

                  ElevatedButton(
                     style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
                     ),
                    onPressed: () {
                      DatePicker.showDateTimePicker(
                        context,
                        showTitleActions: true,
                        onChanged: (date) {},
                        onConfirm: (date) {
                          selectedAppointment.userId = widget.viewmodel.user.id;
                          selectedAppointment.name = widget.viewmodel.user.name;
                          selectedAppointment.hospitalName =
                              dependency<HospitalListViewmodel>()
                                  .hospital
                                  .hospitalName;
                          selectedAppointment.doctorid =
                              widget.viewmodel.doctor.id;
                          selectedAppointment.day = date;
                          isDone = true;

                          if (isDone)
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  contentPadding: EdgeInsets.only(top: 10.0),
                                  // elevation: 16,
                                  content: Container(
                                    // height: 400.0,
                                    width: 360.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                                'Dr : ' +
                                                    widget
                                                        .viewmodel.doctor.name,
                                                style: TextStyle(
                                                  color: Colors.brown
                                                      .withOpacity(1),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Divider(
                                          color: Colors.grey,
                                          height: 4.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          // mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 30.0, right: 30.0),
                                              child: Text(
                                                'Date : ' +
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(
                                                            selectedAppointment
                                                                .day),
                                                style: TextStyle(
                                                  color: Colors.brown
                                                      .withOpacity(1),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 30.0, right: 30.0),
                                              child: Text(
                                                'Hospital Name : ' +
                                                    selectedAppointment
                                                        .hospitalName,
                                                style: TextStyle(
                                                  color: Colors.brown
                                                      .withOpacity(1),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 30.0, right: 30.0),
                                              child: Text(
                                                'Time : ${selectedAppointment.day.hour}:${selectedAppointment.day.minute}${selectedAppointment.day.second}',
                                                style: TextStyle(
                                                  color: Colors.brown
                                                      .withOpacity(1),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () => {
                                                setState(
                                                  () {},
                                                ),
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(
                                                  Colors.red,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Icon(Icons.clear),
                                                  Text("Disapprove"),
                                                ],
                                              ),
                                            ),
                                            ElevatedButton(
                                              // style: ButtonStyle(backgroundColor: Colors.brown),
                                              // style: ButtonStyle(
                                              //   backgroundColor:
                                              //       MaterialStateProperty.all<
                                              //           Color>(
                                              //     Colors.red,
                                              //   ),
                                              // ),
                                              onPressed: () => {
                                                main(),
                                                widget.viewmodel.addAppoinmtent(
                                                    selectedAppointment),
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PatientAppointmentScreen(
                                                            0),
                                                  ),
                                                ),
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Icon(Icons.done),
                                                  Text("Confirm"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                        },
                        minTime: DateTime.utc(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day + 1,
                            09,
                            00),
                        maxTime: DateTime.utc(
                            DateTime.now().year,
                            DateTime.now().month + 1,
                            DateTime.now().day,
                            20,
                            00),
                      );
                    },
                    child: Container(
                      width: width-80,
                      height: 80,
                      decoration: BoxDecoration(
                        // color: Colors.brown[600],

                        // borderRadius: BorderRadius.circular(30.0),
                        //border: Border.all(color: _color),
                      ),
                      child: Center(
                        child: Text(
                          "Pick Your Appointment",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  main() async {
    String username = "abdallahodda332@gmail.com";
    String password = "b@Dy771999";

    final smtpServer = gmail(username, password);
    // Creating the Gmail server

    // Create our email message.
    final message = Message()
      ..from = Address(username)
      ..recipients.add(widget.viewmodel.user.email) //recipent email
      ..ccRecipients.addAll(
          ['destCc1@example.com', 'destCc2@example.com']) //cc Recipents emails
      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..from = "body"; //bcc Recipents email
  }
}
