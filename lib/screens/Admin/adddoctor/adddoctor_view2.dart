import 'package:flutter/material.dart';
import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/screens/Admin/adddoctor/widgets/admininput.dart';
import 'package:patientaid/screens/Admin/admin_view.dart';
import 'package:patientaid/screens/Admin/admin_viewmodel.dart';
import 'package:provider/provider.dart';

class AddDoctor2 extends StatelessWidget {
  static const routeName = '/adddoctor2-screen';
  AddDoctor2({Key key}) : super(key: key);

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
    final hospital = ModalRoute.of(context).settings.arguments as Hospital;
    print(hospital.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
        title: Text('Add Doctor'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(15),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Fullname :',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    AdminInput(
                        hintTitle: 'fullname',
                        adminInput: fullname,
                        keyboardType: TextInputType.name,
                        password: false),
                    Text(
                      'Email:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    AdminInput(
                        hintTitle: 'email',
                        adminInput: email,
                        keyboardType: TextInputType.emailAddress,
                        password: false),
                    Text(
                      'Gender:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    AdminInput(
                        hintTitle: 'gender',
                        adminInput: gender,
                        keyboardType: TextInputType.name,
                        password: false),
                    Text(
                      'Biography:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    AdminInput(
                        hintTitle: 'biography',
                        adminInput: bio,
                        keyboardType: TextInputType.name,
                        password: false),
                    Text(
                      'Internship:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    AdminInput(
                        hintTitle: 'internship',
                        adminInput: internship,
                        keyboardType: TextInputType.name,
                        password: false),
                    Text(
                      'Medical Education:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    AdminInput(
                        hintTitle: 'medical education',
                        adminInput: medicalEducation,
                        keyboardType: TextInputType.name,
                        password: false),
                    Text(
                      'Password:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    AdminInput(
                        hintTitle: 'password',
                        adminInput: password,
                        keyboardType: TextInputType.name,
                        password: true),
                    Text(
                      'Fellowship:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    AdminInput(
                        hintTitle: 'fellowship',
                        adminInput: fellowship,
                        keyboardType: TextInputType.name,
                        password: false),
                    Text(
                      'Residency:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    AdminInput(
                        hintTitle: 'residency',
                        adminInput: residency,
                        keyboardType: TextInputType.name,
                        password: false),
                    Text(
                      'Specialty:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    AdminInput(
                        hintTitle: 'specialty',
                        adminInput: specialty,
                        keyboardType: TextInputType.name,
                        password: false),
                    Consumer<AdminViewModel>(
                      builder: (context, viewmodel, _) => ElevatedButton(
                          onPressed: () async {
                            if (fullname.text.isNotEmpty &&
                                email.text.isNotEmpty &&
                                gender.text.isNotEmpty &&
                                bio.text.isNotEmpty &&
                                internship.text.isNotEmpty &&
                                medicalEducation.text.isNotEmpty &&
                                password.text.isNotEmpty &&
                                fellowship.text.isNotEmpty &&
                                residency.text.isNotEmpty &&
                                specialty.text.isNotEmpty) {
                              viewmodel.addIndex("biography", bio.text);
                              viewmodel.addIndex("email", email.text);
                              viewmodel.addIndex("fellowship", fellowship.text);
                              viewmodel.addIndex("gender", gender.text);
                              viewmodel.addIndex("internship", internship.text);
                              viewmodel.addIndex(
                                  "medicalEducation", medicalEducation.text);
                              viewmodel.addIndex("password", password.text);
                              viewmodel.addIndex("residency", residency.text);
                              viewmodel.addIndex("specialty", specialty.text);
                              viewmodel.addIndex("name", fullname.text);

                              await viewmodel.addDoctor(
                                  hospital, fullname.text);

                              Navigator.pushNamedAndRemoveUntil(context,
                                  AdminScreen.routeName, (route) => false);
                            }
                          },
                          child: Text(
                            'Add',
                            style: TextStyle(fontSize: 20),
                          )),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
