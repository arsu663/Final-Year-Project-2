import 'package:patientaid/Model/Appointment.dart';
import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/services/appointments/appointment_service.dart';
import 'package:patientaid/services/doctor/doctor_servcie.dart';

class DoctorProfileviewModel extends Viewmodel {
  Doctor _doctor;
  get doctor => _doctor;
  set doctor(value) => _doctor = value;
  DoctorService get service => dependency();
  User get user => dependency<LoginViewmodel>().user;

  Future<void> getDoctor() async {
    turnBusy();
    doctor = await service.getDoctor(doctor.id);
    turnIdle();
  }

// AppointmentService get service =>dependency();
  Future<void> addAppoinmtent(Appointment appointment) async {
    turnBusy();
    await dependency<AppointmentService>().addAppointment(appointment);
    turnIdle();
  }
}
