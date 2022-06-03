import 'package:flutter/material.dart';
import 'package:patientaid/helpers/hex_code.dart';
import '../../../app/main_dependencies.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);
  Widget build(BuildContext context) {
    Color _color = Colors.brown[600];
    return AppBar(
      backgroundColor: _color,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () {
          Navigator.pop(context, null);
        },
      ),
      title: Center(
        child: Text(
          "Records",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
