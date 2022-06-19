import 'package:patientaid/Model/Appointment.dart';
import 'package:patientaid/Model/user.dart';

abstract class AppointmentService {
  Future<List<Appointment>> getUserTodoList(int, User user,int index);
  Future<List<Appointment>> getRecordedApps();
  Future<Appointment> addAppointment(Appointment app);
  Future<Appointment> updateAppointment(Appointment app);
}
