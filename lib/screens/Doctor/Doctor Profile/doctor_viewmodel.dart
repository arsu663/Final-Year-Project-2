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

  Future getDoctor(id) async {
    turnBusy();
    doctor = await service.getDoctor(id);
    turnIdle();
  }

  Future getDoctorname(drID) async {
    turnBusy();
    final dr = await service.getDoctorName(drID);
    turnIdle();
    return dr;
  }

// AppointmentService get service =>dependency();
  Future<void> addAppoinmtent(Appointment appointment, Doctor drname) async {
    appointment.drName = drname.name;
    turnBusy();
    await dependency<AppointmentService>().addAppointment(appointment);
    turnIdle();
  }
}
