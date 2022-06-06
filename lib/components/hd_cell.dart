import '../app/main_dependencies.dart';

class HDCell extends StatelessWidget {
  final Doctor doctor;
  final Function onTap;

  const HDCell({
    Key key,
    @required this.doctor,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 283,
        height: 199,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.brown[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            // Positioned(
            //   top: 16,
            //   right: 16,
            //   child: SizedBox(
            //     width: 162,
            //     height: 139,
            //     child: Image(
            //       image: AssetImage('assets/logo.png'),
            //     ),
            //   ),
            // ),
            Positioned(
              top: 32,
              left: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    doctor.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // Text(
                  //   doctor.lastName,
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 22,
                  //     fontWeight: FontWeight.w700,
                  //   ),
                  // ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    ' Specialist',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   left: 0,
            //   bottom: 0,
            //   child: Container(
            //     width: 77,
            //     height: 54,
            //     decoration: BoxDecoration(
            //       color: HexColor("#2A3AC0"),
            //       borderRadius: BorderRadius.only(
            //         topRight: Radius.circular(32),
            //       ),
            //     ),
            //     child: Icon(
            //       Icons.arrow_right,
            //       color: Colors.white,
            //       size: 18,
            //     ),
            //   ),
            // ),
            Positioned(
              right: 0,
              bottom: 0,
              child: SizedBox(
                width: 120,
                height: 150,
                child: Hero(
                  tag: doctor.firstName + doctor.lastName,
                  child: Image(
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.none,
                    image: AssetImage(doctor.imageURL),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
