import 'package:patientaid/app/main_dependencies.dart';

import 'PickAppointment_viewMoel.dart';

class NullAppointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              
              "Sorry you don't have any appointments yet",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize:24, fontWeight: FontWeight.w800, ),
            ),
            if (dependency<AppointmentViewmdeol>().user != null && dependency<AppointmentViewmdeol>().appointments !=null)
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HospitalListViewScreen(),
                  ),
                ),
                child: Text("New Appointment"),
              )
          ],
        ),
      ),
    );
  }
}
