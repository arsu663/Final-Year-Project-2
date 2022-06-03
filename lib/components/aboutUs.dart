import 'package:flutter/material.dart';
import '../app/main_dependencies.dart';

class AboutUs extends StatelessWidget {
  Color _mainColor = HexColor("2A2AC0");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.brown[600],
          title: Text(
            "About Us",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        // drawer: SideDrawer(),
        backgroundColor: Colors.brown[300],
        body: SingleChildScrollView(
          child: Container(
            height: 600,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(10),
            // height: 600,
            // width: 500,
            color: Colors.brown[600],
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    "PatientAid",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/hospital.jpg",
                    fit: BoxFit.cover,
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.black45,
                  ),
                  Text(
                    "PatientAid houses a unique portfolio of services that keep healthcare professionals abreast of the latest and most significant developments within their clinical, surgical or management area.Covering all aspects of the hospital environment, hospitalmanagement.net provides both clinical and senior administrative staff with instant access to a comprehensive reference source introducing technologies, services and procedures our audience can employ to improve the management of their facilities.",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "RobotoCondensed",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
