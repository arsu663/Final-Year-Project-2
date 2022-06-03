import 'package:flutter/material.dart';
import '../../app/main_dependencies.dart';

class HomePageScreen extends StatefulWidget {
  static const String route = "/homepage_screen";
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  double height, width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        height = constraints.maxHeight;
        width = constraints.maxWidth;
        return Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              _buildColumn(),
            ],
          ),
        );
      },
    );
  }

  _buildColumn() {
    return Container(
      height: height,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(),
          Container(
            width: width,
            height: 150,
            child: Image.asset(
              "assets/logo.png",
              height: 100,
              width: width,
            ),
          ),
          Spacer(),
          SizedBox(
            height: 135,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/signup_view");
            },
            child: Container(
              height: 0.075 * height,
              width: 0.8 * width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.brown[300],
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/login_view");
            },
            child: Container(
              height: 0.075 * height,
              width: 0.8 * width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  "Log in",
                  style: TextStyle(
                      color: Colors.brown[300],
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
