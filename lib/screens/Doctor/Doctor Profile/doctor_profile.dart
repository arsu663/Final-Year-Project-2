import 'package:flutter/material.dart';
import 'package:patientaid/app/dependencies.dart';
import 'package:patientaid/screens/Hospital/HospitalDash/hospital_viewmodel.dart';

import '../../../view.dart';
import 'doctor_card.dart';
import 'doctor_viewmodel.dart';
import 'widgets.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return SelectorView<DoctorProfileviewModel, dynamic>(
        initViewmodel: (drViewmodel) =>
            drViewmodel.doctor = dependency<HDashboardViewmodel>().doctor,
        selector: (_, drViewmodel) =>
            drViewmodel.busy ? 0 : drViewmodel.doctor.id,
        builder: (_, drViewmodel, __) {
          final dr = drViewmodel.doctor;
          return Scaffold(
            appBar: StandardAppBar(),
            body: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
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
                alignment: Alignment.center,
                child: DoctorCard(doctorInfo: dr, viewmodel: drViewmodel),
              ),
            ),
          );
        });
  }
}
