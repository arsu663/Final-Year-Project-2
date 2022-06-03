import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/services/hospitals/hospital_service.dart';

class HospitalListViewmodel extends Viewmodel {
// HospitalListViewmodel();
  List<Hospital> _hospitals;
  int _selected;

  get hospitals => _hospitals;
  set hospitals(value) => _hospitals = value;
  get selected => _selected;
  set selected(value) => _selected = value;
  HostpitalService get service => dependency();

  Future<List<Hospital>> getHospitals() async {
    turnBusy();
    hospitals = await service.getAllHostpitals();
    selected = null;
    turnIdle();
    return _hospitals;
  }

  Hospital get hospital =>
      (hospitals != null) && (selected != null) ? hospitals[selected] : null;
  void selectHospital(int index) {
    selected = index;
  }
}
