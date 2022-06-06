import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../app/main_dependencies.dart';

class PatientDashboardScreen extends StatefulWidget {
  static const String route = "/PatientDashboardScreen";
  @override
  _PatientDashboardScreen createState() => _PatientDashboardScreen();
}

List<PatientDashCategory> listCategory0 = [
  PatientDashCategory(
      icon: FontAwesomeIcons.bookMedical,
      subTitle: "Book your Appointment",
      title: "Appointments",
      color: Colors.brown[500],
      image: "/assets/appointment.png"),
  PatientDashCategory(
    icon: FontAwesomeIcons.recordVinyl,
    subTitle: "Your Latest Records",
    title: "Records",
    color: HexColor("#2A2AC0"),
  ),
  PatientDashCategory(
    icon: Icons.forum,
    subTitle: "Nearby Hospitals",
    title: "Nearby Hospitals",
    color: HexColor("#2A2AC0"),
  ),
  PatientDashCategory(
    icon: Icons.settings,
    subTitle: "Edit",
    title: "Account Settings",
    color: HexColor("#2A2AC0"),
  ),
];

class _PatientDashboardScreen extends State<PatientDashboardScreen> {
  bool isFullScreen(Size currentSize, Size fullSize) {
    print("$fullSize == $currentSize");

    if (currentSize.height == fullSize.height &&
        fullSize.width == currentSize.width)
      return true;
    else
      return false;
  }

  Size getSize(BuildContext context) {
    return Size(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
  }

  double width, height;
  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    final user = dependency<LoginViewmodel>().user;

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          width = constraints.maxWidth;
          height = constraints.maxHeight;
          return ConsumerView<LoginViewmodel>(
            initViewmodel: (viewmodel) => dependency<LoginViewmodel>(),
            builder: (context, viewmodel, _) => Scaffold(
              backgroundColor: Colors.brown[500],
              drawer: SideDrawer(),
              bottomNavigationBar: Navbar(),
              appBar: new AppBar(
                automaticallyImplyLeading: false,
                leading: Builder(
                  builder: (BuildContext context) => IconButton(
                    icon: Icon(
                      Icons.sort,
                      color: Colors.white,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                actions: [
                  GestureDetector(
                    onDoubleTap: () {},
                    child: CircleAvatar(
                      backgroundImage:
                          // user.photoURL !=null ?
                          AssetImage(user.photo),
                      //  CircleAvatar(),

                      radius: 25,
                    ),
                  )
                ],
                backgroundColor: Colors.brown[300],
                elevation: 0.0,
                title: Center(
                  child: Text(
                    "Hello ${viewmodel.user.name}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SafeArea(
                      child: Container(
                        height: 550,
                        child: buildGridView(context),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  buildGridView(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PatientDashCategory(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientAppointmentScreen(0),
                  ),
                );
              },
              title: listCategory0[0].title,
              subTitle: listCategory0[0].subTitle,
              icon: listCategory0[0].icon,
              color: listCategory0[0].color,
              image: listCategory0[0].image,
            ),
            PatientDashCategory(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientRecordsScreen(1),
                  ),
                );
              },
              title: listCategory0[1].title,
              subTitle: listCategory0[1].subTitle,
              icon: listCategory0[1].icon,
              color: listCategory0[1].color,
              image: listCategory0[1].image,
            ),
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // PatientDashCategory(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => HospitalMap(),
              //       ),
              //     );
              //   },
              //   title: listCategory0[2].title,
              //   subTitle: listCategory0[2].subTitle,
              //   icon: listCategory0[2].icon,
              //   color: listCategory0[2].color,
              //   image: listCategory0[2].image,
              // ),
              PatientDashCategory(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  );
                },
                title: listCategory0[3].title,
                subTitle: listCategory0[3].subTitle,
                icon: listCategory0[3].icon,
                color: listCategory0[3].color,
                image: listCategory0[3].image,
              ),
            ],
          ),
        )
      ],
    );
  }
}
