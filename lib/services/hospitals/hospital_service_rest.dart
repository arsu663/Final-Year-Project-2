import 'package:patientaid/Model/hospital.dart';
import 'package:patientaid/app/dependencies.dart';

import '../rest.dart';
import 'hospital_service.dart';

class HospitalServiceRest implements HostpitalService {
  RestService get service => dependency();

  Future<List<Hospital>> getAllHostpitals() async {
    final List hospital = await service.get("hospitals");
    final h = hospital.map((e) => Hospital.fromJson(e)).toList();
    return h;
  }
}
