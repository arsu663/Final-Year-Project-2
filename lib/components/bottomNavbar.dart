import '../app/main_dependencies.dart';
import 'package:mdi/mdi.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight,
      decoration: BoxDecoration(
        color: Colors.brown[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavBarItem("About Us", Mdi.home, 0),
          _buildNavBarItem("Contact Us", Icons.contact_page, 1),
          // _buildNavBarItem("NEARBY", Mdi.mapSearch, 2),
        ],
      ),
    );
  }

  _buildNavBarItem(String text, IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        _bottomNavIndex = index;
        setState(() {});
        switch (index) {
          case 0:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AboutUs()));
            print('on Browse');
            break;
          case 1:
            print('on Contact');
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ContactUs()));
            break;
          case 2:
            break;
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:
                index == _bottomNavIndex ? Colors.white54 : Colors.black,
          ),
          Text(
            text,
            style: TextStyle(
              color: index == _bottomNavIndex
                  ? Colors.white54
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
