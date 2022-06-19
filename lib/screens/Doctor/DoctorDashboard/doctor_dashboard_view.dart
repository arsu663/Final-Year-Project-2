import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mdi/mdi.dart';
import 'package:patientaid/screens/Doctor/DoctorDashboard/Doctor_Availblity/doctoravailability_view.dart';
import '../../../app/main_dependencies.dart';

class DoctorDashboardScreen extends StatefulWidget {
  Doctor _doctor;

  static const String route = "/DoctorDashboardScreen";
  DoctorDashboardScreen({doctor}) : _doctor = doctor;
  @override
  _DoctorDashboardScreen createState() => _DoctorDashboardScreen();
}

List<DoctorDashCategory> listCategory = [
  DoctorDashCategory(
      icon: FontAwesomeIcons.bookMedical,
      subTitle: "Incoming Appointments",
      title: "Appointments",
      color: HexColor("#2A2AC0"),
      image: "/assets/appointment.png"),
  DoctorDashCategory(
    icon: FontAwesomeIcons.recordVinyl,
    subTitle: "Reviews",
    title: "Hospital Reviews",
    color: HexColor("#2A2AC0"),
  ),
  DoctorDashCategory(
    icon: Icons.event_available_sharp,
    subTitle: "Availability",
    title: "Update Availability",
    color: HexColor("#2A2AC0"),
  ),
  DoctorDashCategory(
    icon: Icons.settings,
    subTitle: "Edit",
    title: "Account Settings",
    color: HexColor("#2A2AC0"),
  ),
];

class _DoctorDashboardScreen extends State<DoctorDashboardScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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

  int _bottomNavIndex = 0;
  double width, height;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          width = _width;
          height = constraints.maxHeight;
          // final dr = dependency<LoginViewmodel>().dr;
          // print(dr.name);
          return ConsumerView<LoginViewmodel>(
              initViewmodel: (viewmodel) => dependency<LoginViewmodel>(),
              builder: (context, viewmodel, ___) => Scaffold(
                  drawer: SideDrawer(),
                  bottomNavigationBar: _buildBottomNavBar(),
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    leading: Builder(
                      builder: (BuildContext context) => IconButton(
                          icon: Icon(
                            Icons.sort,
                            color: HexColor("#2A2AC0"),
                          ),
                          onPressed: () => Scaffold.of(context).openDrawer()),
                    ),
                    actions: [
                      GestureDetector(
                          onDoubleTap: () {},
                          child: CircleAvatar(
                            backgroundColor: HexColor("#2A2AC0"),
                            backgroundImage:
                                // user.photoURL !=null ?
                                // AssetImage(dr.imagePath),
                                AssetImage("assets/profile.jpg"),
                          )),
                    ],
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    title: Center(
                      child: Text(
                        "${viewmodel.dr.name}",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: HexColor("#2A2AC0")),
                      ),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // SafeArea(
                          //   child: Container(
                          //     margin: EdgeInsets.all(5),
                          //     padding: EdgeInsets.symmetric(
                          //         horizontal: 25, vertical: 5),
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(25),
                          //       border: Border.all(
                          //         color: Colors.blue,
                          //       ),
                          //     ),
                          //     child: TextField(
                          //       decoration: InputDecoration(
                          //         border: InputBorder.none,
                          //         icon: Icon(Icons.search),
                          //         hintText: "Search here",
                          //         hintStyle: TextStyle(color: Colors.blue),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Container(
                            height: 550,
                            width: _width,
                            child: buildGridView(context),
                          ),
                        ],
                      ),
                    ),
                  )));
        },
      ),
    );
  }

  Container _buildBottomNavBar() {
    return Container(
      height: kBottomNavigationBarHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavBarItem("Contact Us", Mdi.home, 0),
          // _buildNavBarItem("About Us", Icons.contact_page, 1),
          // _buildNavBarItem("NEARBY", Mdi.mapSearch, 2),
        ],
      ),
    );
  }

  buildGridView(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DoctorDashCategory(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientAppointmentScreen(0)));
              },
              title: listCategory[0].title,
              subTitle: listCategory[0].subTitle,
              icon: listCategory[0].icon,
              color: listCategory[0].color,
              image: listCategory[0].image,
            ),
            DoctorDashCategory(
              onPressed: () {
                Navigator.pushNamed(context, DoctorAvailability.routeName);
              },
              title: listCategory[2].title,
              subTitle: listCategory[2].subTitle,
              icon: listCategory[2].icon,
              color: listCategory[2].color,
              image: listCategory[2].image,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DoctorDashCategory(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              title: listCategory[3].title,
              subTitle: listCategory[3].subTitle,
              icon: listCategory[3].icon,
              color: listCategory[3].color,
              image: listCategory[3].image,
            ),
          ],
        )
      ],
    );
  }

  _buildNavBarItem(String text, IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        this._bottomNavIndex = index;
        setState(() {});
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ContactUs()));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:
                index == _bottomNavIndex ? Colors.blue[900] : Colors.grey[400],
          ),
          Text(
            text,
            style: TextStyle(
              color: index == _bottomNavIndex
                  ? Colors.blue[900]
                  : Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
