import 'package:http/http.dart';
import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/services/doctor/doctor_servcie.dart';

class DoctorServiceRest implements DoctorService {
  RestService service = dependency();
  Future<List<Doctor>> getHospitalDoctors(hospitalId) async {
    final doctors = await service.get("doctors?hospitalId=$hospitalId");
    return (doctors as List).map((e) => Doctor.fromJson(e)).toList();
  }

  Future<Doctor> getDoctor(doctorId) async {
    print(doctorId);
    final doctor = await service.get("doctors/$doctorId");
    return Doctor.fromJson(doctor);
  }

  Future<Doctor> getDoctorName(doctorId) async {
    print(doctorId);
    final doctor = await service.get32("doctors/$doctorId");
    return Doctor.fromJson(doctor);
  }

  Future<Doctor> updateDoctor(dr) async {
    final doctor = await service.patch("doctors/${dr.id}", data: dr);
    return Doctor.fromJson(doctor);
  }

  Future  updateDoctorAvailability(availability,drID) async {

    var toJson = {
      'availability': availability
    };
    final response = await service.patch("doctors/$drID", data: toJson);
    return response;
  }

  

  
}
