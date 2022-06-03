import 'package:patientaid/Model/event.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource extends CalendarDataSource {
  // the appointment is different from our appointment, the second appointmnt is comming from our class Event which is a list and the first appointment is from the class 'CalendarDataSource'
  EventDataSource(List<Event> appointments) {
    this.appointments = appointments;
    
  }

  // to get event back so we access the index of our list and then convert back to Event object so we can access
  Event getEvent(int index) => appointments[index] as Event;

  // @override
  // DateTime getEndTime(int index) => getEvent(index).to;

  @override
  DateTime getStartTime(int index) => getEvent(index).from;

  @override
  String getSubject(int index) => getEvent(index).title;
}
