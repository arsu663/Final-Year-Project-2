import 'package:patientaid/Model/Appointment.dart';
import 'package:patientaid/screens/Hospital/HospitalList/hospital_viewmodel.dart';
import '../../../Model/mock_data.dart';
import '../../../app/main_dependencies.dart';
import 'package:intl/intl.dart';

import 'doctor_viewmodel.dart';

class StandardAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.0, 0.0),
            end: Alignment(1.0, 0.0),
            colors: [
              Theme.of(context).primaryColor,
              Colors.black45,
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class StarRating extends StatelessWidget {
  final int starCount;
  final num rating;
  final Color color;

  StarRating({
    this.starCount = 5,
    this.rating = .0,
    this.color,
  });

  Icon buildStar(BuildContext context, int rank) {
    if (rank >= rating) {
      return Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
      );
    } else if (rank > rating - 1 && rank < rating) {
      return Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      return Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        starCount,
        (rank) => buildStar(context, rank),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final bool edit;
  final Function onPressed;

  SectionTitle({@required this.title, this.edit = false, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
        bottom: 20.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              if (edit)
                IconButton(
                  icon: Icon(Icons.edit_outlined, color: Color(0xFF9f9f9f)),
                  onPressed: onPressed,
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: edit ? 5 : 20,
            ),
            child: Divider(
              color: Colors.black12,
              height: 1,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class AppointemntsSection extends StatefulWidget {
  bool isSelectedDay = false;
  bool isSelectedTime = false;
  User user;
  DoctorProfileviewModel viewmodel;
  AppointemntsSection(this.viewmodel);
  Appointment app;
  @override
  _AppointemntsSectionState createState() => _AppointemntsSectionState();
}

class _AppointemntsSectionState extends State<AppointemntsSection> {
  Appointment selectedAppointment;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SectionTitle(title: "Appointments"),
            Container(
              margin: const EdgeInsets.only(
                bottom: 15.0,
              ),
              height: 60,
              child: ListView.separated(
                itemCount: appointmentstoselect.length,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      right: 10.0,
                      left: 20.0,
                      top: 5.0,
                      bottom: 5.0,
                    ),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      shape: BoxShape.rectangle,
                      color: appointmentstoselect[index].isSelected
                          ? Colors.blue[100]
                          : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.only(
                            left: 30,
                            right: 10,
                            top: 6,
                          ),
                        ),
                        textStyle: MaterialStateProperty.all(
                          TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.5),
                          ),
                        ),
                      ),
                      onPressed: () => setState(() {
                        appointmentstoselect[index].isSelected =
                            !appointmentstoselect[index].isSelected;
                        selectedAppointment = appointmentstoselect[index];
                      }),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              DateFormat('EEEE')
                                  .format(appointmentstoselect[index].day),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat('yyyy-MM-dd')
                                  .format(appointmentstoselect[index].day),
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.white.withOpacity(.8)),
              ),
            ),
          ],
        ),
        AppointmentDays(
            selectedAppointment,
            // widget.viewmodel.use
            widget.viewmodel),
        ElevatedButton(
          onPressed: () {
            selectedAppointment.userId = widget.viewmodel.user.id;
            selectedAppointment.name = widget.viewmodel.user.name;
            selectedAppointment.hospitalName =
                dependency<HospitalListViewmodel>().hospital.hospitalName;
            selectedAppointment.doctorid = widget.viewmodel.doctor.id;
            widget.viewmodel.addAppoinmtent(
                selectedAppointment, widget.viewmodel.doctor.name);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PatientAppointmentScreen(0)));
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(200, 60)),
            backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(42, 42, 192, .7)),
          ),
          child: Text(
            'Save',
            style: TextStyle(fontSize: 30),
          ),
        )
      ],
    );
  }
}

class AppointmentDays extends StatefulWidget {
  Appointment appointment;
  DoctorProfileviewModel viewmodel;
  AppointmentDays(this.appointment, this.viewmodel);

  @override
  _AppointmentDaysState createState() => _AppointmentDaysState();
}

class _AppointmentDaysState extends State<AppointmentDays> {
  DateTime app;
  @override
  Widget build(BuildContext context) {
    return Container();

    // Container(
    //   padding: EdgeInsets.only(top: 20),
    //   height: 190,
    //   child: widget.appointment != null
    //       ? ListView.separated(
    //           itemCount: widget.appointment.date.length,
    //           shrinkWrap: true,
    //           scrollDirection: Axis.horizontal,
    //           itemBuilder: (context, index) {
    //             return GestureDetector(
    //               onTap: () => setState(() {
    //                 app = DateTime.utc(
    //                     widget.appointment.day.year,
    //                     widget.appointment.day.month,
    //                     widget.appointment.day.day,
    //                     widget.appointment.date[index].hour,
    //                     widget.appointment.date[index].minute);
    //                 // widget.appointment.day =app;
    //                 // widget.viewmodel.user.name = 'omar';
    //                 // print(widget.viewmodel.user.name);
    //                 // widget.user.appointment = app;
    //                 widget.appointment.day = app;
    //                 widget.viewmodel.user.hasAppointment =
    //                     !widget.viewmodel.user.hasAppointment;
    //               }),
    //               child: DayCard(
    //                 onTap: () => setState(
    //                   () {
    //                     app = DateTime.utc(
    //                         widget.appointment.day.year,
    //                         widget.appointment.day.month,
    //                         widget.appointment.day.day,
    //                         widget.appointment.date[index].hour,
    //                         widget.appointment.date[index].minute);

    //                     widget.appointment.day = app;
    //                     // widget.user.appointment = app;
    //                     // print(widget.user.appointment.day);
    //                     widget.viewmodel.user.hasAppointment =
    //                         widget.viewmodel.user.hasAppointment;

    //                     // print(widget.user.name);
    //                   },
    //                 ),
    //                 title:
    //                     '${widget.appointment.date[index].hour}:${widget.appointment.date[index].minute}',
    //                 value: '',
    //                 // isDone:
    //                 //     // false
    //                 //     widget.viewmodel.user.hasAppointment &&
    //                 //             widget.viewmodel.user.appointment.hour ==
    //                 //                 widget.appointment.date[index].hour &&
    //                 //             widget.viewmodel.user.appointment.minute ==
    //                 //                 widget.appointment.date[index].minute
    //                 //         ? true
    //                 //         : false,
    //               ),
    //             );
    //           },
    //           separatorBuilder: (context, index) =>
    //               Divider(color: Colors.white.withOpacity(.8)),
    //         )
    //       : Container(),
    // );
  }
}

class DayCard extends StatefulWidget {
  final String title;
  final String value;
  final Function onTap;
  final bool isDone;

  DayCard(
      {Key key,
      @required this.title,
      @required this.value,
      this.isDone,
      @required this.onTap})
      : super(key: key);

  @override
  _DayCardState createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(right: 15.0),
        width: 120,
        height: 50,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF486581),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        child: Container(
                          decoration: new BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            shape: BoxShape.rectangle,
                            color: widget.isDone
                                ? Theme.of(context).accentColor
                                : Color(0xFFF0F4F8),
                          ),
                          width: 30,
                          height: 30,
                          child: Center(
                            child: Icon(
                              Icons.check,
                              color: widget.isDone
                                  ? Colors.white
                                  : Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                        onTap: widget.onTap,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BasicInfo extends StatelessWidget {
  final String title;
  final String info;
  final EdgeInsetsGeometry margin;

  BasicInfo({@required this.title, @required this.info, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Text(
                info,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.brown[900],
                ),
              )
            ],
          ),
        ));
  }
}

class PhysicianHistoryColumn extends StatelessWidget {
  final List<Widget> physicianInfo;

  PhysicianHistoryColumn({this.physicianInfo});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: physicianInfo,
      ),
    );
  }
}

class PhysicianHistorySection extends StatelessWidget {
  final List<Widget> physicianInfo;

  PhysicianHistorySection({this.physicianInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: "Physician History"),
        Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: physicianInfo,
            ),
          ),
        ),
      ],
    );
  }
}

class EditBasicInfoSection extends StatefulWidget {
  final User user;
  Doctor dr;
  EditBasicInfoSection({@required this.user, @required this.dr});

  @override
  _EditBasicInfoSectionStateState createState() =>
      _EditBasicInfoSectionStateState();
}

class _EditBasicInfoSectionStateState extends State<EditBasicInfoSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 1.0)),
        SectionTitle(
          title: "Basic Information",
          edit: true,
        ),
        // SectionTitle(title: "Basic Information", edit: true),
        Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: (widget.user != null)
                      ? Column(
                          children: [
                            TextField(
                                showCursor: true,
                                decoration: InputDecoration(
                                  counterText: widget.user.name,
                                  counterStyle: TextStyle(color: Colors.black),
                                  labelText: 'Name:',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onChanged: (value) {
                                  widget.user.name = value;
                                }),
                            TextField(
                                showCursor: true,
                                decoration: InputDecoration(
                                  counterText: widget.user.email,
                                  counterStyle: TextStyle(color: Colors.black),
                                  labelText: 'email:',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onChanged: (value) {
                                  widget.user.email = value;
                                }),

                            TextField(
                                showCursor: true,
                                decoration: InputDecoration(
                                  counterText: widget.user.phoneNumber,
                                  counterStyle: TextStyle(color: Colors.black),
                                  labelText: 'phone number:',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onChanged: (value) {
                                  widget.user.phoneNumber = value;
                                  print(widget.user.phoneNumber);
                                }),
                            //       if(widget.dr != null)

                            // TextField(
                            // textInputAction: TextInputAction.next,
                            // showCursor: true,
                            // decoration: InputDecoration(
                            //   counterText: widget.dr.gender,
                            //   counterStyle: TextStyle(color: Colors.black),
                            //   labelText: 'Gender:',
                            //   labelStyle: TextStyle(
                            //     color: Color(0xFF9f9f9f),
                            //   ),
                            // ),
                            // onChanged: (value) {
                            //   widget.dr.gender = value;
                            // }),
                            // TextField(
                            //     textInputAction: TextInputAction.next,
                            //     showCursor: true,
                            //     decoration: InputDecoration(
                            //       counterText: widget.dr.prefix,
                            //       counterStyle: TextStyle(color: Colors.black),
                            //       labelText: 'Lcation:',
                            //       labelStyle: TextStyle(
                            //         color: Color(0xFF9f9f9f),
                            //       ),
                            //     ),
                            //     onChanged: (value) {
                            //       widget.dr.prefix = value;
                            //     }),
                            // TextField(
                            //     textInputAction: TextInputAction.next,
                            //     showCursor: true,
                            //     decoration: InputDecoration(
                            //       counterText: widget.dr.email,
                            //       counterStyle: TextStyle(color: Colors.black),
                            //       labelText: 'Email:',
                            //       labelStyle: TextStyle(
                            //         color: Color(0xFF9f9f9f),
                            //       ),
                            //     ),
                            //     onChanged: (value) {
                            //       widget.dr.email = value;
                            //     }),
                            // TextField(
                            //     textInputAction: TextInputAction.next,
                            //     showCursor: true,
                            //     decoration: InputDecoration(
                            //       counterText: widget.dr.specialty,
                            //       counterStyle: TextStyle(color: Colors.black),
                            //       labelText: 'Specialty:',
                            //       labelStyle: TextStyle(
                            //         color: Color(0xFF9f9f9f),
                            //       ),
                            // ),
                            // onChanged: (value) {
                            //   widget.dr.specialty = value;
                            // }),
                            // TextField(
                            //     textInputAction: TextInputAction.next,
                            //     showCursor: true,
                            //     decoration: InputDecoration(
                            //       counterText: widget.dr.medicalEducation,
                            //       counterStyle: TextStyle(color: Colors.black),
                            //       labelText: 'Medical Education:',
                            //       labelStyle: TextStyle(
                            //         color: Color(0xFF9f9f9f),
                            //       ),
                            //     ),
                            // onChanged: (value) {
                            //   widget.dr.medicalEducation = value;
                            // }),

                            // TextField(
                            //   textInputAction: TextInputAction.next,
                            //   showCursor: true,
                            //   decoration: InputDecoration(
                            //     counterText: widget.dr.internship,
                            //     counterStyle: TextStyle(color: Colors.black),
                            //     labelText: 'Internship:',
                            //     labelStyle: TextStyle(
                            //       color: Color(0xFF9f9f9f),
                            //     ),
                            //   ),
                            //   onChanged: (value) {
                            //     widget.dr.internship = value;
                            //   },
                            // ),
                            // TextField(
                            //   textInputAction: TextInputAction.next,
                            //   showCursor: true,
                            //   decoration: InputDecoration(
                            //     counterText: widget.dr.fellowship,
                            //     counterStyle: TextStyle(color: Colors.black),
                            //     labelText: 'Fellowship:',
                            //     labelStyle: TextStyle(
                            //       color: Color(0xFF9f9f9f),
                            //     ),
                            //   ),
                            //   onChanged: (value) {
                            //     widget.dr.fellowship = value;
                            //   },
                            // ),
                          ],
                        )
                      : Column(
                          children: [
                            TextField(
                                showCursor: true,
                                decoration: InputDecoration(
                                  counterText: widget.dr.name,
                                  counterStyle: TextStyle(color: Colors.black),
                                  labelText: 'Name:',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onChanged: (value) {
                                  widget.dr.name = value;
                                }),
                            TextField(
                                showCursor: true,
                                decoration: InputDecoration(
                                  counterText: widget.dr.email,
                                  counterStyle: TextStyle(color: Colors.black),
                                  labelText: 'email:',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onChanged: (value) {
                                  widget.dr.email = value;
                                }),
                            TextField(
                                textInputAction: TextInputAction.next,
                                showCursor: true,
                                decoration: InputDecoration(
                                  counterText: widget.dr.gender,
                                  counterStyle: TextStyle(color: Colors.black),
                                  labelText: 'Gender:',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onChanged: (value) {
                                  widget.dr.gender = value;
                                }),
                            TextField(
                                textInputAction: TextInputAction.next,
                                showCursor: true,
                                decoration: InputDecoration(
                                  counterText: widget.dr.prefix,
                                  counterStyle: TextStyle(color: Colors.black),
                                  labelText: 'Lcation:',
                                  labelStyle: TextStyle(
                                    color: Color(0xFF9f9f9f),
                                  ),
                                ),
                                onChanged: (value) {
                                  widget.dr.prefix = value;
                                }),
                            TextField(
                                textInputAction: TextInputAction.next,
                                showCursor: true,
                                decoration: InputDecoration(
                                  counterText: widget.dr.email,
                                  counterStyle: TextStyle(color: Colors.black),
                                  labelText: 'Email:',
                                  labelStyle: TextStyle(
                                    color: Color(0xFF9f9f9f),
                                  ),
                                ),
                                onChanged: (value) {
                                  widget.dr.email = value;
                                }),
                            TextField(
                                textInputAction: TextInputAction.next,
                                showCursor: true,
                                decoration: InputDecoration(
                                  counterText: widget.dr.specialty,
                                  counterStyle: TextStyle(color: Colors.black),
                                  labelText: 'Specialty:',
                                  labelStyle: TextStyle(
                                    color: Color(0xFF9f9f9f),
                                  ),
                                ),
                                onChanged: (value) {
                                  widget.dr.specialty = value;
                                }),
                            TextField(
                                textInputAction: TextInputAction.next,
                                showCursor: true,
                                decoration: InputDecoration(
                                  counterText: widget.dr.medicalEducation,
                                  counterStyle: TextStyle(color: Colors.black),
                                  labelText: 'Medical Education:',
                                  labelStyle: TextStyle(
                                    color: Color(0xFF9f9f9f),
                                  ),
                                ),
                                onChanged: (value) {
                                  widget.dr.medicalEducation = value;
                                }),
                            TextField(
                              textInputAction: TextInputAction.next,
                              showCursor: true,
                              decoration: InputDecoration(
                                counterText: widget.dr.internship,
                                counterStyle: TextStyle(color: Colors.black),
                                labelText: 'Internship:',
                                labelStyle: TextStyle(
                                  color: Color(0xFF9f9f9f),
                                ),
                              ),
                              onChanged: (value) {
                                widget.dr.internship = value;
                              },
                            ),
                            TextField(
                              textInputAction: TextInputAction.next,
                              showCursor: true,
                              decoration: InputDecoration(
                                counterText: widget.dr.fellowship,
                                counterStyle: TextStyle(color: Colors.black),
                                labelText: 'Fellowship:',
                                labelStyle: TextStyle(
                                  color: Color(0xFF9f9f9f),
                                ),
                              ),
                              onChanged: (value) {
                                widget.dr.fellowship = value;
                              },
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BasicInfoSection extends StatefulWidget {
  final Function onPressed;
  User user;
  Doctor doctor;

  BasicInfoSection(
      {@required this.onPressed, @required this.user, @required this.doctor});

  @override
  _BasicInfoSectionState createState() => _BasicInfoSectionState();
}

class _BasicInfoSectionState extends State<BasicInfoSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 1.0)),
        SectionTitle(
          title: "Basic Information",
          edit: true,
          onPressed: widget.onPressed,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: (widget.user != null)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PersonalInfo(title: 'Name', info: widget.user.name),
                            // PersonalInfo(
                            //     title: 'First Nmae', info: widget.user.firstName),
                            // PersonalInfo(
                            //     title: 'Last Nmae', info: widget.user.lastName),
                            PersonalInfo(title: 'Gender', info: "male"),
                            PersonalInfo(
                                title: 'Email', info: widget.user.email),
                            // PersonalInfo(
                            //     title: 'Specialty', info: widget.user.specialty),
                            PersonalInfo(
                                title: 'Phone number',
                                info: widget.user.phoneNumber),
                            // PersonalInfo(
                            //     title: 'Residency', info: widget.user.residency),
                            // PersonalInfo(
                            //     title: 'Internship', info: widget.user.internship),
                            // PersonalInfo(
                            //     title: 'Fellowship', info: widget.user.fellowship),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PersonalInfo(
                                title: 'Name', info: widget.doctor.name),
                            PersonalInfo(
                                title: 'First Nmae',
                                info: widget.doctor.firstName),
                            PersonalInfo(
                                title: 'Last Nmae',
                                info: widget.doctor.lastName),
                            PersonalInfo(title: 'Gender', info: "male"),
                            PersonalInfo(
                                title: 'Email', info: widget.doctor.email),
                            PersonalInfo(
                                title: 'Specialty',
                                info: widget.doctor.specialty),
                            // PersonalInfo(
                            //     title: 'Phone number',
                            //     info: widget.doctor.phoneNumber),
                            PersonalInfo(
                                title: 'Residency',
                                info: widget.doctor.residency),
                            PersonalInfo(
                                title: 'Internship',
                                info: widget.doctor.internship),
                            PersonalInfo(
                                title: 'Fellowship',
                                info: widget.doctor.fellowship),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PersonalInfo extends StatelessWidget {
  final String title;
  final String info;

  PersonalInfo({@required this.title, @required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF6f6f6f),
            ),
          ),
          Text(
            info,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF9f9f9f),
            ),
          )
        ],
      ),
    );
  }
}

class EditBiographySection extends StatefulWidget {
  final Doctor doctor;

  EditBiographySection({@required this.doctor});
  @override
  _EditBiographySectionState createState() => _EditBiographySectionState();
}

class _EditBiographySectionState extends State<EditBiographySection> {
  TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 10.0)),
        SectionTitle(
          title: "Biography",
          edit: true,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Flexible(
              child: TextField(
                controller: _controller,
                onSubmitted: (String value) {
                  // editBiography = false;
                  widget.doctor.biography = value;
                },
                textInputAction: TextInputAction.next,
                maxLines: null,
                showCursor: true,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: widget.doctor.biography,
                  border: InputBorder.none,
                  hintMaxLines: 8,
                  hintStyle: TextStyle(
                    color: Color(0xFF9f9f9f),
                  ),
                  isCollapsed: true,
                ),
                enabled: true,
                autofocus: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BiographySection extends StatelessWidget {
  final String biography;
  final Function onPressed;
  final bool edit;

  BiographySection({@required this.biography, this.edit, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "Biography",
          edit: edit,
          onPressed: onPressed,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              biography,
              style: TextStyle(
                color: Color(0xFF9f9f9f),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FloatButton extends StatelessWidget {
  final Icon icon;
  final String title;

  FloatButton({@required this.icon, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {},
          color: Theme.of(context).primaryColor,
          highlightColor: Theme.of(context).primaryColorLight,
          textColor: Colors.white,
          child: icon,
          padding: EdgeInsets.all(16),
          shape: CircleBorder(),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10.0,
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xFF6f6f6f),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfilePicture extends StatelessWidget {
  final String imagePath;

  ProfilePicture({@required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
                transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                child: CircleAvatar(
                    radius: 70, backgroundImage: AssetImage(imagePath)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final String name;
  final String specialty;

  UserInfo({@required this.name, @required this.specialty});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 15.0,
        bottom: 5.0,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xFF6f6f6f),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(
                specialty,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
