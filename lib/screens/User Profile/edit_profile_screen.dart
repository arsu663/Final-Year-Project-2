import '../../app/main_dependencies.dart';
import '../Doctor/Doctor Profile/widgets.dart';
import 'edit_card.dart';

class EditProfileScreen extends StatefulWidget {
   User user ;
   Doctor dr;
  EditProfileScreen({@required this.user,@required this.dr});
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: StandardAppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0, 0.0),
              end: Alignment(1.0, 0.0),
              colors: [
                Theme.of(context).primaryColor,
                Colors.black45,
              ],
            ),
          ),
          alignment: Alignment.center,
          child: EditProfileCard(user: widget.user,dr:widget.dr),
        ),
      ),
    );
  }
}
