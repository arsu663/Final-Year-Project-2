import 'package:patientaid/Model/Appointment.dart';
import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/services/appointments/appointment_service.dart';

class AppointmentViewmdeol extends Viewmodel {
  AppointmentService get service => dependency();

  List<Appointment> _appointments;
  get appointments {
    return _appointments;
  }

  Doctor get dr => dependency<LoginViewmodel>().dr;

  User _user;
  get appointment => _appointments != null ? _appointments : null;
  User get user => dependency<LoginViewmodel>().user;
  set user(User user) {
    _user = user;
    getAppoinment();
  }

  Future<void> getAppoinment() async {
    if (user == null && dr == null) return null;
    turnBusy();
    if (dr == null) {
      _appointments = await service.getUserTodoList(user.id, user,0);
    } else {
      _appointments = await service.getUserTodoList(dr.id, user,1);
      _user = null;
    }
    turnIdle();
  }

  List<Appointment> _apps;

  get recorded => _apps;
  set recorded(value) => _apps = value;

  Future<List<Appointment>> recodedApps() async {
    turnBusy();
    _apps = await service.getRecordedApps();
// return apps;
    turnIdle();
  }

  Future<void> updateAppoinmtent(Appointment appointment) async {
    turnBusy();
    appointment.doctorid = dr.id;
    await dependency<AppointmentService>().updateAppointment(appointment);
    turnIdle();
  }
}
