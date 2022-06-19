import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/services/doctor/doctor_servcie.dart';

class DoctorAvailabilityViewModel extends ChangeNotifier {
  Doctor get dr => dependency<LoginViewmodel>().dr;
  DoctorService get service => dependency();

  bool isAvailabile = true;

  updateAvailability() async {
    isAvailabile = !isAvailabile;
    final response =
        await service.updateDoctorAvailability(isAvailabile, dr.id);
    notifyListeners();
    print(response);
  }
}
