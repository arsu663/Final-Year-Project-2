import 'package:flutter/material.dart';
import '../../app/main_dependencies.dart';

class WelcomePage extends StatefulWidget {
  static const String route = "/WelcomePage";
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  AnimationController controller;

  Animation buttonAnimation,
      textAnimation,
      painterAnimation,
      positionAnimation,
      fadeTextAnimation;

  double height, width;
  bool showWelcomeText = false;

  @override
  void initState() {
    initializeAnimations();
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  void initializeAnimations() {
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: 2, milliseconds: 500));

    painterAnimation =
        Tween<double>(begin: 0.0, end: 12.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.25, 0.5, curve: Curves.easeInOut),
    ));

    textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.4, 0.6, curve: Curves.easeInOut),
    ));

    positionAnimation =
        Tween<double>(begin: 0.5, end: 0.3).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.625, 0.7, curve: Curves.easeInOut),
    ));

    fadeTextAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.7, 0.8, curve: Curves.easeInOut),
    ));
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Icon(Icons.local_hospital_outlined),
          ),
          CustomPaint(
            painter: WelcomePainter(painterAnimation.value),
            child: Stack(
              children: [
                textAnimation.value > 0.0 ? _buildWelcomeText() : Container(),
                fadeTextAnimation.value > 0
                    ? _buildDetailTextAndButton(context)
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildDetailTextAndButton(BuildContext context) {
    return Positioned(
      top: 0.4 * height,
      left: 0.1 * width,
      right: 0.1 * width,
      child: Opacity(
        opacity: fadeTextAnimation.value,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              " To PatientAid App This App is designed and developed to ease the interaction between patients and the medical field , numerous features are included in PatientAid to support the patient in his different booking processes So what are you waiting for Let's start.",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 0.05 * height),
            GestureDetector(
              onTap: () {
                controller.reverse().then((value) {
                  Navigator.of(context).pushReplacementNamed("/homepage_screen");
                });
              },
              child: Container(
                height: 0.075 * height,
                width: 0.6 * width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white.withOpacity(0.25)),
                child: Center(
                  child: Text(
                    "Let's start",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildWelcomeText() {
    return Positioned(
      top: positionAnimation.value * height,
      left: 0,
      right: 0,
      child: Opacity(
        opacity: textAnimation.value,
        child: Container(
          child: Center(
            child: Text(
              "Welcome",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
