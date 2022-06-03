import 'package:flutter/material.dart';
import '../../../app/main_dependencies.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mdi/mdi.dart';

import 'PickAppointment_viewMoel.dart';

class Trackingscreen extends StatefulWidget {
  AppointmentViewmdeol vewimdeol;
  int index;
  Trackingscreen(this.index);
  static const String route = "/Trackingscreen";
  @override
  _TrackingscreenState createState() => _TrackingscreenState();
}

class _TrackingscreenState extends State<Trackingscreen> {
  double width, height;

  HexColor mainColor = HexColor("#2A2AC0");

  @override
  Widget build(BuildContext context) {
    return ConsumerView<AppointmentViewmdeol>(
      initViewmodel: (vewimdoel) => vewimdoel.appointments,
      builder: (context, vewimdoel, __) {
        widget.vewimdeol = vewimdoel;
        return LayoutBuilder(builder: (context, constraints) {
          height = constraints.maxHeight;
          width = constraints.maxWidth;
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.indigo,
              primaryColor: mainColor,
              fontFamily: GoogleFonts.ubuntu().fontFamily,
            ),
            child: Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      HexColor("#dbe3f6"),
                      HexColor("#fcfdff"),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).padding.top +
                            (0.05 * height)),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: mainColor),
                          padding: EdgeInsets.all(7.0),
                          child: Icon(
                            Mdi.circle,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                    // _buildStepper(),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: mainColor.withOpacity(0.25),
                            width: 0.75,
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Mdi.progressQuestion,
                              color: mainColor,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Having troubles?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline
                                      .copyWith(
                                        color: Colors.grey[500],
                                      ),
                                ),
                                SizedBox(height: 1),
                                Text(
                                  "Contact Us",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  _buildStepper() {
    return Container(
      child: Stepper(
        currentStep: 3,
        // controlsBuilder: (BuildContext context,ControlsDetails controls
        //     {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
        //   return Container();
        // },
        controlsBuilder: (BuildContext context, ControlsDetails controls  ) {
          return Container();
        },
        steps: [
          _buildStep(
              0,
              "Enter your details",
              "",
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                ],
              )),
          _buildStep(
              2,
              "Waiting For Approval",
              "",
              Column(
                children: [],
              )),
          _buildStep(
              3,
              "Approved",
              "",
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Card number",
                    ),
                  ),
                ],
              )),
          _buildStep(
              4,
              "Generate appointment Details",
              "",
              Column(
                children: [],
              )),
        ],
      ),
    );
  }

  Step _buildStep(int index, String text, String subtitle, Widget content) {
    return Step(
      content: Container(),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "STEP ${index + 1}",
            style: Theme.of(context).textTheme.overline,
          ),
          SizedBox(height: 1),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: (index == 0 || index == 1)
                  ? Colors.black
                  : HexColor("#979da9"),
            ),
          ),
        ],
      ),
      isActive: (index == 0 ||
          index == 1 ||
          (index == 2 &&
              widget.vewimdeol.appointments[widget.index].disapprove == true &&
              widget.vewimdeol.appointments[widget.index].approve == false) ||
          (index == 2 ||
              index == 3 &&
                  widget.vewimdeol.appointments[widget.index].disapprove ==
                      true &&
                  widget.vewimdeol.appointments[widget.index].approve == true)),
      state: (index == 0 ||
              index == 1 ||
              (index == 2 &&
                  widget.vewimdeol.appointments[widget.index].disapprove ==
                      true &&
                  widget.vewimdeol.appointments[widget.index].approve ==
                      false) ||
              (index == 3 &&
                  widget.vewimdeol.appointments[widget.index].disapprove ==
                      true &&
                  widget.vewimdeol.appointments[widget.index].approve == true))
          ? StepState.complete
          : StepState.indexed,
    );
  }
}
