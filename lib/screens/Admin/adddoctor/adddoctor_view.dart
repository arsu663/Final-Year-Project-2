import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/screens/Admin/adddoctor/adddoctor_view2.dart';
import 'package:patientaid/screens/Hospital/HospitalList/hospital_viewmodel.dart';

class AddDoctor extends StatelessWidget {
  static const routeName = '/adddoctor-screen';
  const AddDoctor({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
        title: Text('Select New Doctor\'s Clinic'),
        centerTitle: true,
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
                          Navigator.pushNamed(context, AddDoctor2.routeName,
                              arguments: hospital);
                        },
                        // dense: true,
                        title: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            hospital.hospitalName,
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.headline4,
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
    );
  }
}
