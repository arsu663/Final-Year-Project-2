
import '../app/main_dependencies.dart';
import 'package:flutter/material.dart';

class TrdCell extends StatelessWidget {
  final Doctor doctor;

  const TrdCell({
    Key key,
    @required this.doctor,
  }) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            color: HexColor('#404B63').withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageSection(),
          SizedBox(
            width: 16,
          ),
          _detailsSection(),
        ],
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  /// Image Section
  Container _imageSection() {
    return Container(
      height: 77,
      width: 90,
      decoration: BoxDecoration(
        color: HexColor("#2A2AC0"),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(doctor.imagePath),
        ),
      ),
    );
  }

  /// Details Section
  Column _detailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              doctor.rank.toString(),
              style: TextStyle(
                color: HexColor('#929BB0'),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Icon(
              Icons.star,
              color: HexColor('#FFBB23'),
              size: 14,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          doctor.name ,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          doctor.specialty + ' Specialist',
          style: TextStyle(
            color: HexColor('#929BB0'),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
