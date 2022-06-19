import 'package:patientaid/app/main_dependencies.dart';

abstract class DoctorService {
  Future<List<Doctor>> getHospitalDoctors(int);
  Future<Doctor> getDoctor(int);
  Future<Doctor> getDoctorName(int);
  Future<Doctor> updateDoctor(Doctor);
  Future updateDoctorAvailability(availability,drid);
}
