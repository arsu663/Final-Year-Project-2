import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../app/main_dependencies.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  double height, width;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: Colors.brown[200],
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              "assets/logo.png",
              fit: BoxFit.fitHeight,
            ),
            // UserAccountsDrawerHeader(
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            //   accountName: null,
            //   accountEmail: null,
            // ),
            ListTile(
              iconColor: Colors.white,
              // tileColor: Colors.white,
              textColor: Colors.white,
                dense: true,
                leading: Icon(Mdi.faceProfile, size: 40),
                title: Text("Profile", style: TextStyle(fontSize: 16),),
                subtitle: Text("Edit Profile"),
                onTap: () {}),
            ListTile(
               iconColor: Colors.white,
              // tileColor: Colors.white,
              textColor: Colors.white,
                dense: true,
                leading: Icon(Mdi.phoneSettings, size: 30),
                title: Text("Contact Us",style: TextStyle(fontSize: 16),),
                subtitle: Text("Contact Info"),
                onTap: () => Navigator.pushNamed(context, "/contactUs")),
            // ListTile(
            //     dense: true,
            //     leading: Icon(Mdi.check, size: 30),
            //     title: Text("Track Appointment"),
            //     subtitle: Text("Appointment info"),
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => Trackingscreen()));
            //     }),
            ListTile(
               iconColor: Colors.white,
              // tileColor: Colors.white,
              textColor: Colors.white,
              dense: true,
              leading: Icon(Icons.settings, size: 30),
              title: Text("App Settings",style: TextStyle(fontSize: 16),),
              subtitle: Text("Change App Settings"),
              onTap: () {},
            ),
            ListTile(
               iconColor: Colors.white,
              // tileColor: Colors.white,
              textColor: Colors.white,
                dense: true,
                leading: Icon(Icons.info_outline, size: 30),
                title: Text("About us",style: TextStyle(fontSize: 16),),
                onTap: () => Navigator.pushNamed(context, "/aboutUs")),
            ListTile(
               iconColor: Colors.white,
              // tileColor: Colors.white,
              textColor: Colors.white,
              dense: true,
              leading: Icon(Icons.logout, size: 30),
              title: Text("Log Out"),
              onTap: () {
              //  final provider =
              //      Provider.of<GoogleSignInProvider>(context, listen: false);
              //  provider.logout();
              dependency<LoginViewmodel>().user =null;
              dependency<LoginViewmodel>().dr =null;
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => LoginScreen()));
              }
            ),
          ],
        ),
      ),
    );
  }
}
