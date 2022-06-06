import 'package:patientaid/screens/User%20Profile/edit_profile_screen.dart';
// import '../../screens/User%20Profile/edit_profile_screen.dart';
// import '../../screens/User%20Profile/profile_screen.dart';

import 'main_dependencies.dart';

Route<dynamic> createRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/splash_screen":
      return MaterialPageRoute(builder: (context) => SplashScreen());

    case "/homepage_screen":
      return MaterialPageRoute(builder: (context) => HomePageScreen());

    case "/login_view":
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case "/signup_view":
      return MaterialPageRoute(builder: (context) => SignUpScreen());

    case "/ProfileScreen":
      return MaterialPageRoute(builder: (context) => ProfileScreen());
    case "/EditProfileScreen":
      return MaterialPageRoute(
          builder: (context) {
            EditProfileScreen args = settings.arguments;
            return EditProfileScreen(
                user :args.user,dr:args.dr
              );
              });
    case "/DoctorProfile":
      return MaterialPageRoute(builder: (context) => DoctorProfile());
    case "/DoctorDashboardScreen":
      return MaterialPageRoute(builder: (context) => DoctorDashboardScreen());
    case "/PatientDashboardScreen":
      return MaterialPageRoute(builder: (context) => PatientDashboardScreen());
    case "/welcome_Screen":
      return MaterialPageRoute(builder: (context) => WelcomePage());
    // case "/appointment":
    //   return MaterialPageRoute(builder: (context) => DoctorPickAppointment());
    // case "/pickAppointments":
    //   return MaterialPageRoute(builder: (context) => DoctorPickAppointment());
    case "/categories_Screen":
      return MaterialPageRoute(builder: (context) => CategoriesScreen());
    case "/hospital_view_screen":
      return MaterialPageRoute(builder: (context) => HospitalListViewScreen());
    // case "/nearby_hospital":
    //   return MaterialPageRoute(builder: (context) => HospitalMap());
    // case "/hospital_details_screen":
    //   return MaterialPageRoute(
    //       builder: (context) => HospitalDetailScreen());
    case "/feedback_screen":
      return MaterialPageRoute(builder: (context) => FeedbackScreen());
    case "/Trackingscreen":
      return MaterialPageRoute(builder: (context) => Trackingscreen(settings.arguments));
    case "/Hospitaldashboard":
      return MaterialPageRoute(builder: (context) => Hospitaldashboard());
    case "/AboutUs":
      return MaterialPageRoute(builder: (context) => AboutUs());
    case "/contactUs":
      return MaterialPageRoute(builder: (context) => ContactUs());
    case "/doctor_calender":
      return MaterialPageRoute(builder: (context) => DoctorCalender());
    case "/event_editing":
      return MaterialPageRoute(builder: (context) => EventEditing());
      
  }
}
