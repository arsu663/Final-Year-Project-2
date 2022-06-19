import 'package:flutter/material.dart';
import '../../../app/main_dependencies.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);
  Widget build(BuildContext context) {
    Color _color = Colors.brown[200];
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: _color,
      title: Center(
        child: Text(
          "Appointments",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
