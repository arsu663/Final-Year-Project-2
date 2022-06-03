import 'package:flutter/material.dart';

class Event {
   String title;

   DateTime from;
   DateTime to;
   Color backgroundColor;

  Event({
    this.title="",
    this.from=null,
    this.to =null,
    this.backgroundColor = Colors.lightGreen,
  });
}
