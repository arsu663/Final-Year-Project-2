import 'package:patientaid/Model/admin.dart';
import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/services/admin/admin_services.dart';

class AdminViewModel extends ChangeNotifier {
  AdminViewModel._privateConstructor();

  //Singleton intiation
  static final AdminViewModel _instance = AdminViewModel._privateConstructor();

  // static AdminViewModel get instance => _instance;
  factory AdminViewModel() {
    return _instance;
  }

  AdminServices adminServices = AdminServices();

  String email;
  String password;
  String doctorName;
  Admin admin;
  List<Doctor> doctors;
  Map<String, dynamic> pDoctor = {
    "availability": true,
    "imagePath": "assets/mathew.png",
    "imageURL": "assets/mathew.png",
    "rank": 3.25,
    "prefix": "prefix",
  };

  Map<String, dynamic> updatedDoc = {};

  void addIndex(String key, dynamic value) => pDoctor[key] = value;
  void addUpdatedIndex(String key, dynamic value) => updatedDoc[key] = value;

  addDoctor(Hospital hospital, String fullname) async {
    addIndex('hospitalId', hospital.id);
    addIndex('firstName', fullname.split(' ')[0]);
    addIndex('lastName', fullname.split(' ')[1]);

    final response = await adminServices.addDoctor(pDoctor);

    return response;
  }

  authentcate() async {
    final admin = await adminServices.authenticate(email, password);
    if (admin == null) return;

    return admin;
  }

  getDoctors() async {
    doctors = await adminServices.getDoctors();
  }

  updateDoctor(drID) async {
    final updated = Map.from(updatedDoc)
      ..removeWhere((key, value) => value.isEmpty);
    print(updated);
    final response = await adminServices.updateDoctor(updated, drID);
    return response;
  }

  deleteDoctor(drID) async {
    await adminServices.deleteDoctor(drID);

  }
}
