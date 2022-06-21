import 'package:flutter/material.dart';
import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/screens/Admin/adddoctor/adddoctor_view.dart';
import 'package:patientaid/screens/Admin/admin_viewmodel.dart';
import 'package:patientaid/screens/Admin/editdoctor/editdoctor_view.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatelessWidget {
  static const routeName = '/admin-screen';
  const AdminScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<AdminViewModel>(context);
    final admin = Provider.of<AdminViewModel>(context).admin;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, "/login_view", (route) => false),
        ),
        backgroundColor: Colors.brown[200],
        title: Column(children: [
          Text(
            'Hello, ${admin.name}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'Manage Doctors',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ]),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: viewmodel.getDoctors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return const Center(child: Text('An error has occured'));
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      // alignment: Alignment.center,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: viewmodel.doctors
                            .map((e) => Container(
                                  margin: const EdgeInsets.only(
                                      right: 10, left: 10, top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.brown[100],
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.black)),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                        // radius: 30,
                                        child: Image.asset('${e.imagePath}')),
                                    title: Text(
                                      e.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          fontFamily: 'Raleway'),
                                    ),
                                    trailing: GestureDetector(
                                        onTap: () => Navigator.of(context)
                                            .pushNamed(EditDoctor.routeName,
                                                arguments: e),
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.black,
                                        )),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.brown[700],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, AddDoctor.routeName),
                        icon: Icon(
                          Icons.add,
                          size: 24,
                        ),
                        label: Text('Add New Doctor'),
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
