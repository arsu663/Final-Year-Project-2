import 'package:flutter/material.dart';
import 'package:patientaid/screens/User%20Profile/edit_profile_screen.dart';

import '../../Model/Doctor.dart';
import '../../app/main_dependencies.dart';

import '../Doctor/Doctor Profile/widgets.dart';

class ProfileCard extends StatefulWidget {
  User user;
  Doctor dr;
  final String edit;
  LoginViewmodel viewmodel;

  ProfileCard({this.user, this.dr, this.edit, this.viewmodel});
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  String editBiography = 'editBiography';
  String editBasicInfo = 'editBasicInfo';

  void _navigate() async {
    final result = await Navigator.pushNamed(context, "/EditProfileScreen",
        arguments: (widget.user == null)
            ? EditProfileScreen(user: null, dr: Doctor.copy(widget.dr))
            : EditProfileScreen(user: User.copy(widget.user), dr: null));

    if (result != null) {
      dynamic _dr;
      if (widget.user != null) {
        widget.user = await widget.viewmodel.updateUser(result);
      } else {
        _dr = await widget.viewmodel.updatedr(result);

        // print(widget.dr.name);

        widget.dr = _dr;
      }
    }
  }

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
                child: ProfilePicture(imagePath: widget.user.photo),
              ),
              (widget.user != null)
                  ? UserInfo(name: widget.user.name, specialty: "")
                  : UserInfo(
                      name: widget.dr.name, specialty: widget.dr.specialty),
               (widget.dr != null)
                 ? BiographySection(
                      biography: widget.dr.biography,
                      edit: true,
                      onPressed: () => _navigate(),
                    )
                  : Container(),
              BasicInfoSection(
                user: widget.user,
                doctor: widget.dr,
                onPressed: () => _navigate(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
