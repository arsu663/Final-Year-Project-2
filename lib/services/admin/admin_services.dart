import 'package:patientaid/Model/admin.dart';
import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/screens/Admin/adddoctor/adddoctor_view.dart';

class AdminServices extends RestService {
  RestService get rest => dependency();
  authenticate(String email, String password) async {
    final admin = await rest.get('admins?email=$email&&password=$password');
    if (admin == null) return;

    return Admin.fromJson(admin[0]);
  }

  getDoctors() async {
    final List tempdoctors = await rest.get('doctors');
    if (tempdoctors == null) return;

    final doctors = tempdoctors.map((e) => Doctor.fromJson(e)).toList();

    return doctors;
  }

  addDoctor(json) async {
    final response = await rest.post('doctors', data: json);
    if (response == null) return;

    return response;
  }

   updateDoctor(json,drID) async {
    final response = await rest.patch('doctors/$drID', data: json);
    if (response == null) return;

    return response;
  }

   deleteDoctor(drID) async {
    final response = await rest.delete('doctors/$drID');
    if (response == null) return;

    return response;
  }
}
