import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../../app/main_dependencies.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  var rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: HexColor("#2A2AC0"),
        title: Text("Patient Feedback Screen"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "How would you rate your experience ?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black54,
                  width: 2.0,
                ),
              ),
              child: TextField(
                textAlign: TextAlign.center,
                maxLines: 5,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: "Plese Provide your feedback here ",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SmoothStarRating(
              color: Colors.amber,
              // borderColor: Colors.amber,
              rating: rating,
              isReadOnly: false,
              size: 50,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              // defaultIconData: Icons.star_border,
              starCount: 5,
              allowHalfRating: true,
              spacing: 5.0,
              onRated: (value) {
                print("rating value -> $value");
                // print("rating value dd -> ${value.truncate()}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
