import 'package:patientaid/screens/Doctor/Doctor%20Profile/doctor_viewmodel.dart';
import 'package:patientaid/screens/Hospital/HospitalDash/hospital_viewmodel.dart';
import 'package:patientaid/screens/Hospital/HospitalList/hospital_viewmodel.dart';
import 'package:patientaid/screens/Patient/PatientAppointment/PickAppointment_viewMoel.dart';
import 'package:patientaid/services/appointments/appointment_service.dart';
import 'package:patientaid/services/appointments/appointment_service_rest.dart';
import 'package:patientaid/services/doctor/doctor_servcie.dart';
import 'package:patientaid/services/doctor/doctor_service_rest.dart';
import 'package:patientaid/services/firebase/firebase_service.dart';
import 'package:patientaid/services/hospitals/hospital_service.dart';
import 'package:patientaid/services/hospitals/hospital_service_rest.dart';

import '../app/main_dependencies.dart';
import 'package:get_it/get_it.dart';

//Variable to hold the instance
GetIt dependency = GetIt.instance;

void init() {
  //services
  dependency.registerLazySingleton<RestService>(
    () => RestService(
      // baseUrl: 'http://192.168.211.1:3000', //with Local Json-server
      //baseUrl:
      //    'http://192.168.136.1:5001/patientaid-206bb/us-central1/api', //with Firebase emulators.
      baseUrl:
          'https://us-central1-final-year-project---final.cloudfunctions.net/api', //with Firebase emulators.
    ),
  );

  https://us-central1-final-year-project---final.cloudfunctions.net/api/doctors/24eju9rXSJSS79CFwgqO

  //done

  //viewmodel

  //what type of dependency that we are gonna call
  dependency.registerLazySingleton(() => FirebaseService());
  // dependency
  //     .registerLazySingleton<AuthService>(() => UserAuthServiceFirebase());
  dependency.registerLazySingleton<AuthService>(() => AuthServiceRest());
  dependency.registerLazySingleton<AppointmentService>(
      () => AppointmentServiceRest());
  dependency
      .registerLazySingleton<HostpitalService>(() => HospitalServiceRest());
  dependency.registerLazySingleton<DoctorService>(() => DoctorServiceRest());

// viewmodel
  dependency.registerLazySingleton(() => SignupViewModel());
  dependency.registerLazySingleton(() => LoginViewmodel());
  dependency.registerLazySingleton(() => AppointmentViewmdeol());
  dependency.registerLazySingleton(() => HospitalListViewmodel());
  dependency.registerLazySingleton(() => HDashboardViewmodel());
  dependency.registerLazySingleton(() => DoctorProfileviewModel());
}
