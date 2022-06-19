import 'package:flutter/material.dart';
import 'package:patientaid/screens/Doctor/DoctorDashboard/Doctor_Availblity/doctoravailability_viewmodel.dart';
import 'package:provider/provider.dart';

class DoctorAvailability extends StatelessWidget {
  static const routeName = '/doctoravailability';
  const DoctorAvailability({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[200],
          title: Text('Update your availability'),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          height: size.height * 0.35,
          margin: EdgeInsets.only(
              right: width * 0.050,
              left: width * 0.050,
              top: size.height * 0.25),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Update Your Availability ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Consumer<DoctorAvailabilityViewModel>(
                    builder: (context, viewmodel, _) => Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GestureDetector(
                            onTap: ()async => await viewmodel.updateAvailability() ,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                    viewmodel.isAvailabile
                                        ? Icons.check_circle
                                        : Icons.block,
                                    color: viewmodel.isAvailabile
                                        ? Colors.green
                                        : Colors.red),
                                Text(viewmodel.isAvailabile
                                    ? 'Availabile !'
                                    : 'Not Available')
                              ],
                            ),
                          ),
                        ))
              ],
            ),
          ),
        ));
  }
}
