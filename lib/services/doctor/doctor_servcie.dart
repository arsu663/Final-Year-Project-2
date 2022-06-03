import 'package:patientaid/app/main_dependencies.dart';

abstract class DoctorService {
  Future<List<Doctor>> getHospitalDoctors(int);
  Future<Doctor> getDoctor(int);
  Future<Doctor> updateDoctor(Doctor);
}
