import '../../app/main_dependencies.dart';
import '../Doctor/Doctor Profile/widgets.dart';

class EditProfileCard extends StatefulWidget {
  Doctor dr;
  User user;

  EditProfileCard({@required this.user, @required this.dr});
  @override
  _EditProfileCardState createState() => _EditProfileCardState();
}

class _EditProfileCardState extends State<EditProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 15.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: Colors.brown[100],
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20.0,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context, null);
                            });
                          },
                          color: Theme.of(context).primaryColor,
                          highlightColor: Theme.of(context).primaryColorLight,
                          textColor: Colors.white,
                          child: Icon(Icons.cancel, size: 30),
                          padding: EdgeInsets.all(16),
                          shape: CircleBorder(),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 10.0,
                          ),
                          child: Text(
                            'Cancel',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    (widget.user != null)
                        ? ProfilePicture(imagePath: widget.user.photo)
                        : (widget.dr != null)
                            ? ProfilePicture(imagePath: widget.dr.imagePath)
                            : Text(' '),
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              (widget.user != null)
                                  ? Navigator.pop(context, widget.user)
                                  : (widget.dr != null)
                                      ? Navigator.pop(context, widget.dr)
                                      : Text('');
                            });
                          },
                          color: Theme.of(context).primaryColor,
                          highlightColor: Theme.of(context).primaryColorLight,
                          textColor: Colors.white,
                          child: Icon(Icons.done_all, size: 30),
                          padding: EdgeInsets.all(16),
                          shape: CircleBorder(),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 10.0,
                          ),
                          child: Text(
                            'Done',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              (widget.user != null)
                  ? UserInfo(name: widget.user.name, specialty: "")
                  : (widget.dr != null)
                      ? UserInfo(
                          name: widget.dr.name, specialty: widget.dr.specialty)
                      : Text(''),
              (widget.user == null)
                  ? EditBiographySection(doctor: widget.dr)
                  : Container(),
              EditBasicInfoSection(user: widget.user, dr: widget.dr),
            ],
          ),
        ),
      ],
    );
  }
}
