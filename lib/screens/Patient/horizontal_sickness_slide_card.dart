import 'package:flutter/material.dart';
import '../../app/main_dependencies.dart';

class HorizontaSicknesslSlidingCard extends StatelessWidget {
  final String sicknessName;
  final String imageURL;
  final Function onPressed;

  HorizontaSicknesslSlidingCard(
      {@required this.sicknessName,
      @required this.imageURL,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 160.0,
        child: Column(
          children: [
            // Text(
            //   sicknessName,
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 24,
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),
            // CircleAvatar(
            //   radius: 45,
            //   child: Image.asset(imageURL),
            //   // backgroundImage: AssetImage(
            //   //   imageURL,
            //   // ),
          ],
        ),
      ),
    );
  }
}
