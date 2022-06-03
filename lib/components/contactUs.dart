import 'package:flutter/material.dart';
import '../app/main_dependencies.dart';

class ContactUs extends StatelessWidget {
  Color _mainColor = HexColor("2A2AC0");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown[600],
        title: Text(
          "Contact Us",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // drawer: SideDrawer(),
      backgroundColor: Colors.brown[200],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.brown[600],
          ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 100),
          padding: EdgeInsets.all(10),
          // height: 600,
          // width: 500,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/hospital.jpg"),
                ),
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
                Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                Text(
                  "Thank you for using \"PatientAid\" Appointment system. \n\nIn case of any issue/suggestion/feedback, please contact us on",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    // fontFamily:
                    //     Theme.of(context).textTheme.headline1.fontFamily,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: _mainColor,
                    ),
                    title: Text('+601156494728'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: _mainColor,
                    ),
                    title: Text('mujaddadi663@gmail.com'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
