import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/services/doctor/doctor_servcie.dart';

class HDashboardViewmodel extends Viewmodel {
  DoctorService get service => dependency();
  dynamic _selected;
  List<Doctor> doctors;
  Hospital _hospital;
  get hospital => _hospital;
  set hospital(value) => {_hospital = value, getDoctors()};
  Doctor dr;

  set doctor(value) => {value = doctor};

  Doctor get doctor =>
      (doctors != null) && (_selected != null) ? doctors[_selected] : null;
  void selectDr(int index) {
    turnBusy();
    _selected = index;
    turnIdle();
  }

  Future<void> getDoctors() async {
    turnBusy();
    doctors = await service.getHospitalDoctors(hospital.id);
    _selected = null;
    turnIdle();
  }
}
