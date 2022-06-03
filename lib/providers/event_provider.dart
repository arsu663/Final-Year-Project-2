import '../Model/Appointment.dart';
import '../app/main_dependencies.dart';
import '../screens/Patient/PatientAppointment/PickAppointment_viewMoel.dart';
import '../Model/event.dart';
import '../screens/Doctor/Doctor_timetable/utils.dart';

class EventProvider extends ChangeNotifier {
  //storing the state, in our case its the list of the events
   List<Event> _events = [];
    

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;
  DateTime setDate(DateTime date) => _selectedDate = date;

  // Gets the events or appointments of that selected date not all the other days events
  List<Event> get eventsOfSelectedDate => _events;

  //gets the events
  List<Event> get events {
    addApp();
    notifyListeners();
    return  _events;}

  void addEvent(Event event) {
    _events.add(event);
    
    
    notifyListeners();
  }
Future<List<Event>> addApp() async{
  await dependency<AppointmentViewmdeol>().getAppoinment();
  
  List<Appointment> app  =   dependency<AppointmentViewmdeol>().appointments;
    // notifyListeners();
  
 app.map((e) { 
   if(e.disapprove ==true) 
   {_events.add(Event(from:e.day ,title: e.name));}}).toList();
  
    return _events;


}

}
