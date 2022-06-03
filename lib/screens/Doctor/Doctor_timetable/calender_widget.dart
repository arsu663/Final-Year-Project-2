import 'package:flutter/material.dart';
import 'package:patientaid/app/dependencies.dart';
import 'package:patientaid/helpers/hex_code.dart';
import 'package:patientaid/providers/event_provider.dart';
import 'package:patientaid/screens/Doctor/Doctor_timetable/event_data_source.dart';
import 'package:patientaid/screens/Doctor/Doctor_timetable/tasks_widget.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DoctorCalender extends StatefulWidget {
  @override
  _DoctorCalenderState createState() => _DoctorCalenderState();
}

class _DoctorCalenderState extends State<DoctorCalender> {
  final Color _mainColor = HexColor("2A2AC0");

  @override
  Widget build(BuildContext context) {
    //accessing the event data through provider
    // Provider.of<EventProvider>(context).addApp();
    // initState();

    final events = Provider.of<EventProvider>(context).events;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _mainColor,
        title: Text("Doctor Appointment"),
      ),
      body: FutureBuilder(
        future: Provider.of<EventProvider>(context).addApp(),
        builder: (_, __) => SfCalendar(
          view: CalendarView.week,
          //data source class is to store or put our events inside
          dataSource: EventDataSource(events),
          initialSelectedDate: DateTime.now(),
          cellBorderColor: Colors.transparent,
          onLongPress: (details) {
            final provider = Provider.of<EventProvider>(context, listen: false);
            provider.setDate(details.date);
            showModalBottomSheet(
                context: context, builder: (context) => TasksWidget());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _mainColor,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () => Navigator.pushNamed(context, "/event_editing"),
      ),
    );
  }
}
