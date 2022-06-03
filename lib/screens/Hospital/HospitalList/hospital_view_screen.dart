import 'package:google_fonts/google_fonts.dart';
import 'package:patientaid/screens/Hospital/HospitalList/hospital_viewmodel.dart';
import 'package:patientaid/services/hospitals/hospital_service_rest.dart';

import '../../../app/main_dependencies.dart';
import 'package:flutter/material.dart';

class HospitalListViewScreen extends StatefulWidget {
  List<Hospital> hospital;
  // final List<Hospital> hospital;
  // final List<Doctor> doctors;

  HospitalListViewScreen();
  @override
  _HospitalListViewScreenState createState() => _HospitalListViewScreenState();
}

class _HospitalListViewScreenState extends State<HospitalListViewScreen> {
  void _navigate(BuildContext context, int index, Viewmodel viewmodel) async {
//     await Navigator.pushNamed(context, "/hospital_details_screen",
//     arguments: widget.doctors[index]);
// viewmodel.selectHospital();
    await Navigator.push(
      context,
      
      MaterialPageRoute(
        builder: (context) => Hospitaldashboard(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[500],
        appBar: AppBar(
          backgroundColor: Colors.brown[600],
          centerTitle: true,
          title: Text(
            "Hospitals List",
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: View<HospitalListViewmodel>(
            initViewmodel: (viewmodel) =>
                dependency<HospitalListViewmodel>().getHospitals(),
            builder: (context, viewmodel, __) {
              final hospitals = viewmodel.hospitals;
              return SafeArea(
                child: ListView.builder(
                  // itemCount: hospitals.length,
                  itemCount: hospitals.length,
                  itemBuilder: (context, index) {
                    final hospital = hospitals[index];
                    return Container(
                      height: 140,
                      child: Card(
                        color: Colors.brown[200],
                        shadowColor: Colors.brown,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.all(15),
                        child: ListTile(
                          onTap: () {
                            viewmodel.selectHospital(index);
                            return _navigate(context, index, viewmodel);
                          },
                          // dense: true,
                          title: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              hospital.hospitalName,
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            hospital.description,
                            style: GoogleFonts.aBeeZee(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                            ),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${hospital.location}",
                                style: GoogleFonts.lato(
                                    textStyle:
                                        Theme.of(context).textTheme.headline4,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.brown[600]),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              // Icon(
                              //   Icons.directions_walk,
                              //   size: 30,
                              //   color: Colors.black,
                              // ),
                            ],
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              "${hospital.imageURL}",
                            ),
                            radius: 40,
                          ),
                        ),
                      ),
                    );
                  },
                  // separatorBuilder: (context, index) => Divider(
                  // color: Colors.blueGrey,
                  // thickness: 0.7,
                  // ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
