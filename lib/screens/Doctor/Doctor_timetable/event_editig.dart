import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientaid/helpers/hex_code.dart';
import 'package:patientaid/providers/event_provider.dart';
import 'package:patientaid/screens/Doctor/Doctor_timetable/utils.dart';
import 'package:provider/provider.dart';
import '../../../Model/event.dart';

class EventEditing extends StatefulWidget {
  final Event event;

  EventEditing({this.event});
  @override
  _EventEditingState createState() => _EventEditingState();
}

class _EventEditingState extends State<EventEditing> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  DateTime fromDate;
  DateTime toDate;

  @override
  void initState() {
    super.initState();
    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(
        Duration(hours: 2),
      );
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("2A2AC0"),
        leading: CloseButton(
          color: Colors.white,
        ),
        actions: _buildEditingActions(),
        title: Text("Event Editing"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle(),
              SizedBox(
                height: 12,
              ),
              buildDateTimePicker(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildEditingActions() => [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: saveForm,
          icon: Icon(Icons.done),
          label: Text(
            "Save",
          ),
        )
      ];
  _buildTitle() => TextFormField(
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
            border: UnderlineInputBorder(), hintText: 'Add Title'),
        onFieldSubmitted: (_) => saveForm(),
        validator: (title) => title != null && title.isEmpty
            ? 'Title cannot be left empty'
            : null,
        controller: titleController,
      );

  buildDateTimePicker() => Column(
        children: [
          buildFrom(),
        //  buildTo(),
        ],
      );
  buildFrom() => buildHeadr(
        header: "FROM",
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: buildDropdownField(
                text: Utils.toDate(fromDate),
                onClicked: () => pickFromDateTime(pickDate: true),
              ),
            ),
            Expanded(
              child: buildDropdownField(
                  text: Utils.toTime(fromDate),
                  onClicked: () => pickFromDateTime(pickDate: false)),
            ),
          ],
        ),
      );
  buildDropdownField({
    @required String text,
    @required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  buildHeadr({@required String header, @required Widget child}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              header,
              style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87),
            ),
          ),
          child,
     ],
      );
 // buildTo() => buildHeadr(
 //       header: "TO",
 //       child: Row(
 //         children: [
 //           Expanded(
 //             flex: 2,
 //             child: buildDropdownField(
 //               text: Utils.toDate(toDate),
 //               onClicked: () => pickToDateTime(pickDate: true),
 //             ),
 //           ),
 //           Expanded(
 //             child: buildDropdownField(
 //               text: Utils.toTime(toDate),
 //               onClicked: () => pickToDateTime(pickDate: false),
 //             ),
 //           ),
 //         ],
 //       ),
 //     );

  Future pickFromDateTime({@required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    // here we only need to get the 'date' object that we picked

    if (date == null) return;

    // Validating that out from date is not after toDate
    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }
    //if it is not null then we put this new date object inside our fromDate object
    //later it will store the object inside our DateTime fromDate; object in the begginig
    setState(() => fromDate = date);
  }

  Future pickToDateTime({@required bool pickDate}) async {
    // here we only need to get the date object that we picked
    final date = await pickDateTime(toDate, pickDate: pickDate);
    if (date == null) return;

    //if it is not null then we put this new date object inside our toDate object
    //later it will store the object inside our  DateTime fromDate; object in the starting
    setState(() => toDate = date);
  }

  Future<DateTime> pickDateTime(DateTime initialDate,
      {@required bool pickDate}) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2118),
      );

      if (date == null) return null;
      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );

      if (timeOfDay == null) return null;

      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

      return date.add(time);
    }
  }

  //method for addding to the calendar
  Future saveForm() async {
    final isValid = _formKey.currentState.validate();

  //if the from is valid basically the title is not empty then we create a new event object to put our properties
    if (isValid) {
      final event = Event(
        title: titleController.text,
        from: fromDate,
      //  to: toDate,
      );

      final provider = Provider.of<EventProvider>(context, listen: false);
      provider.addEvent(event);
      Navigator.of(context).pop();
    }
  }
}
