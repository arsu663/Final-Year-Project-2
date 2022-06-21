import 'package:patientaid/screens/Admin/adddoctor/adddoctor_view.dart';
import 'package:patientaid/screens/Admin/adddoctor/adddoctor_view2.dart';
import 'package:patientaid/screens/Admin/admin_view.dart';
import 'package:patientaid/screens/Admin/editdoctor/editdoctor_view.dart';
import 'package:patientaid/screens/Doctor/DoctorDashboard/Doctor_Availblity/doctoravailability_view.dart';
import 'package:patientaid/screens/User%20Profile/edit_profile_screen.dart';

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

    case DoctorAvailability.routeName:
      return MaterialPageRoute(
          builder: (context) => DoctorAvailability(), settings: settings);
    case AdminScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => AdminScreen(), settings: settings);
    case EditDoctor.routeName:
      return MaterialPageRoute(
          builder: (context) => EditDoctor(), settings: settings);
    case AddDoctor.routeName:
    case AddDoctor.routeName:
      return MaterialPageRoute(
          builder: (context) => AddDoctor(), settings: settings);
    case AddDoctor2.routeName:
      return MaterialPageRoute(
          builder: (context) => AddDoctor2(), settings: settings);

    case "/ProfileScreen":
      return MaterialPageRoute(builder: (context) => ProfileScreen());
    case "/EditProfileScreen":
      return MaterialPageRoute(
          builder: (context) => EditProfileScreen(
              user: (settings.arguments as EditProfileScreen).user,
              dr: (settings.arguments as EditProfileScreen).dr),
          settings: settings);
    case "/DoctorProfile":
      return MaterialPageRoute(builder: (context) => DoctorProfile());
    case "/DoctorDashboardScreen":
      return MaterialPageRoute(builder: (context) => DoctorDashboardScreen());
    case "/PatientDashboardScreen":
      return MaterialPageRoute(builder: (context) => PatientDashboardScreen());
    case "/welcome_Screen":
      return MaterialPageRoute(builder: (context) => WelcomePage());
    case "/categories_Screen":
      return MaterialPageRoute(builder: (context) => CategoriesScreen());
    case "/hospital_view_screen":
      return MaterialPageRoute(builder: (context) => HospitalListViewScreen());
    case "/feedback_screen":
      return MaterialPageRoute(builder: (context) => FeedbackScreen());
    case "/Trackingscreen":
      return MaterialPageRoute(
          builder: (context) => Trackingscreen(settings.arguments));
    case "/Hospitaldashboard":
      return MaterialPageRoute(builder: (context) => Hospitaldashboard());
    case "/AboutUs":
      return MaterialPageRoute(builder: (context) => AboutUs());
    case "/contactUs":
      return MaterialPageRoute(builder: (context) => ContactUs());
  }
}
