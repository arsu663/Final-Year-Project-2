import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientaid/app/main_dependencies.dart';
import 'package:patientaid/providers/event_provider.dart';
import 'package:patientaid/screens/Admin/admin_viewmodel.dart';
import 'package:patientaid/screens/Doctor/Doctor%20Profile/doctor_viewmodel.dart';
import 'package:patientaid/screens/Doctor/DoctorDashboard/Doctor_Availblity/doctoravailability_viewmodel.dart';
// import 'package:patientaid/user_notifier.dart';
import 'package:provider/provider.dart';
import 'app/dependencies.dart' as di;
import './app/router.dart' as router;

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EventProvider()),
        ChangeNotifierProvider(create: (context) => DoctorProfileviewModel()),
        ChangeNotifierProvider(create: (context) => AdminViewModel()),
        ChangeNotifierProvider(
            create: (context) => DoctorAvailabilityViewModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.brown[500],
          canvasColor: Colors.brown[400],
          primaryIconTheme: IconThemeData(
            color: Colors.black,
          ),
          fontFamily: GoogleFonts.poppins().fontFamily,
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline5:
                    TextStyle(fontSize: 22, fontFamily: 'RobotoCondensed'),
              ),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.pink[300]),
        ),

        //onGenerateRoute:RouteGenerator.generateRoute,

        debugShowCheckedModeBanner: false,

        initialRoute: "/splash_screen",

        //signup_view

        onGenerateRoute: router.createRoute,
      ),
    );
  }
}
