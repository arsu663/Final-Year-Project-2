import 'package:flutter/material.dart';
import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/screens/Admin/adddoctor/widgets/admininput.dart';
import 'package:patientaid/screens/Admin/admin_view.dart';
import 'package:patientaid/screens/Admin/admin_viewmodel.dart';
import 'package:provider/provider.dart';

class EditDoctor extends StatelessWidget {
  static const routeName = '/editdoctor-screen';
  EditDoctor({Key key}) : super(key: key);

  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController internship = TextEditingController();
  TextEditingController medicalEducation = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController fellowship = TextEditingController();
  TextEditingController residency = TextEditingController();
  TextEditingController specialty = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context).settings.arguments as Doctor;
    // print(hospital.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
        title: Text('Edit Doctor'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(15),
            child: Card(
              // color: Colors.brown[500],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Edit Dr. ${doctor.name}\'s Profile',
                        style: TextStyle(
                          color: Colors.brown,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          // decoration: TextDecoration.combine(
                          //   [
                          //     // TextDecoration.underline,
                          //     // TextDecoration.underline
                          //   ],
                          // ),
                        ),
                      ),
                    ),
                    Text(
                      'Fullname :',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    AdminInput(
                        hintTitle: doctor.name,
                        adminInput: fullname,
                        keyboardType: TextInputType.name,
                        password: false),
                    Text(
                      'Email:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    AdminInput(
                        hintTitle: doctor.email,
                        adminInput: email,
                        keyboardType: TextInputType.emailAddress,
                        password: false),
                    Text(
                      'Gender:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    AdminInput(
                        hintTitle: doctor.gender,
                        adminInput: gender,
                        keyboardType: TextInputType.name,
                        password: false),
                    Text(
                      'Biography:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    AdminInput(
                        hintTitle: doctor.biography,
                        adminInput: bio,
                        keyboardType: TextInputType.name,
                        password: false),
                    Text(
                      'Internship:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    AdminInput(
                        hintTitle: doctor.internship,
                        adminInput: internship,
                        keyboardType: TextInputType.name,
                        password: false),
                    Text(
                      'Medical Education:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    AdminInput(
                        hintTitle: doctor.medicalEducation,
                        adminInput: medicalEducation,
                        keyboardType: TextInputType.name,
                        password: false),
                    Text(
                      'Password:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    AdminInput(
                        hintTitle: doctor.password,
                        adminInput: password,
                        keyboardType: TextInputType.name,
                        password: true),
                    Text(
                      'Fellowship:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    AdminInput(
                        hintTitle: doctor.fellowship,
                        adminInput: fellowship,
                        keyboardType: TextInputType.name,
                        password: false),
                    Text(
                      'Residency:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    AdminInput(
                        hintTitle: doctor.residency,
                        adminInput: residency,
                        keyboardType: TextInputType.name,
                        password: false),
                    Text(
                      'Specialty:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    AdminInput(
                        hintTitle: doctor.specialty,
                        adminInput: specialty,
                        keyboardType: TextInputType.name,
                        password: false),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Consumer<AdminViewModel>(
                          builder: (context, viewmodel, _) => ElevatedButton(
                              onPressed: () async {
                                await viewmodel.deleteDoctor(doctor.id);

                                Navigator.pushNamedAndRemoveUntil(context,
                                    AdminScreen.routeName, (route) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                shadowColor: Colors.red,
                                padding: EdgeInsets.all(15),
                              ),
                              child: Text(
                                'Delete ${doctor.name}',
                                style: TextStyle(fontSize: 12),
                              )),
                        ),
                        Consumer<AdminViewModel>(
                          builder: (context, viewmodel, _) => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                padding: EdgeInsets.all(15),
                              ),
                              onPressed: () async {
                                viewmodel.addUpdatedIndex(
                                    "biography", bio.text);
                                viewmodel.addUpdatedIndex("email", email.text);
                                viewmodel.addUpdatedIndex(
                                    "fellowship", fellowship.text);
                                viewmodel.addUpdatedIndex(
                                    "gender", gender.text);
                                viewmodel.addUpdatedIndex(
                                    "internship", internship.text);
                                viewmodel.addUpdatedIndex(
                                    "medicalEducation", medicalEducation.text);
                                viewmodel.addUpdatedIndex(
                                    "password", password.text);
                                viewmodel.addUpdatedIndex(
                                    "residency", residency.text);
                                viewmodel.addUpdatedIndex(
                                    "specialty", specialty.text);
                                viewmodel.addUpdatedIndex(
                                    "name", fullname.text);

                                await viewmodel.updateDoctor(doctor.id);

                                Navigator.pushNamedAndRemoveUntil(context,
                                    AdminScreen.routeName, (route) => false);
                              },
                              child: Text(
                                'Update ${doctor.name}',
                                style: TextStyle(fontSize: 12),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
