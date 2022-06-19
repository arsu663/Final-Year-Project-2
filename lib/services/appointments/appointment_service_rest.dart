import 'package:firebase_auth/firebase_auth.dart';
import 'package:patientaid/Model/Appointment.dart';
import 'package:patientaid/Model/Parient.dart';
import 'package:patientaid/app/dependencies.dart';
import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/services/appointments/appointment_service.dart';
import 'package:patientaid/Model/user.dart';
import 'package:patientaid/services/rest.dart';

class AppointmentServiceRest implements AppointmentService {
  RestService get rest => dependency();

  Future<List<Appointment>> getUserTodoList(userId, user, index) async {
// var  appointments;
    if (index == 0) {
      final List appointments = await rest.get("Appointments?userId=$userId");
      if (appointments.length == 0) return null;

      return appointments.map((e) => Appointment.fromJson(e)).toList();
    } else {
      final List appointments =
          await rest.get("Appointments?docotorId=$userId");
      if (appointments.length == 0) return null;

      return appointments.map((e) => Appointment.fromJson(e)).toList();
    }
  }

  Future<List<Appointment>> getRecordedApps() async {
    final List apps = await rest.get("Appointments");
    return apps.map((e) => Appointment.fromJson(e)).toList();
  }

  Future<Appointment> addAppointment(data) async {
    final app = await rest.post("Appointments", data: data);
    return Appointment.fromJson(app);
  }

  Future<Appointment> updateAppointment(data) async {
    final app = await rest.patch("Appointments/${data.id}", data: data);
    return Appointment.fromJson(app);
  }
}
