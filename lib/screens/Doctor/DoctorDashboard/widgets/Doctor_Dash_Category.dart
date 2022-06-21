import '../../../../app/main_dependencies.dart';

class DoctorDashCategory extends StatelessWidget {
  final String title;
  final String description;
  final Function onPressed;
  final IconData icon;
  final Color color;
  final String subTitle;
  final String image;

  DoctorDashCategory(
      {this.title,
      this.description,
      this.onPressed,
      this.icon,
      this.color,
      this.subTitle,
      this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        child: Container(
          height: 250,
          width: (width / 2) - 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.0,
                  spreadRadius: 15.0,
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset.zero,
                ),
              ],
              color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: color,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
