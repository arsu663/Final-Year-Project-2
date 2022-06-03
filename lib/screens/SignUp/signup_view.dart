import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../app/main_dependencies.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignUpScreen extends StatefulWidget {
  static const String route = "/LoginPage";
  User user = User();
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
  final _formKey = GlobalKey<FormState>();
  var userInfo = {"email": "", "password": ""};
  // List<User> users = List<User>();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confrimPasswordCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final numberCtrl = TextEditingController();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Color _color = Colors.brown[500];
  double height, width;
  bool isFullScreen(Size currentSize, Size fullSize) {
    print("$fullSize == $currentSize");

    if (currentSize.height == fullSize.height &&
        fullSize.width == currentSize.width)
      return true;
    else
      return false;
  }

  void _showButtonPressDialog(BuildContext context, String provider) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: Duration(milliseconds: 400),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: _color),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          height = constraints.maxHeight;
          width = constraints.maxWidth;
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
              body: ChangeNotifierProvider.value(
            value: dependency<SignupViewModel>(),
            child: Consumer<SignupViewModel>(
              builder: (context, viewmodel, _) {
                return Builder(
                  builder: (ctx) => SingleChildScrollView(
                    child: Container(
                      height: height,
                      width: width,
                      decoration:
                          BoxDecoration(color: Theme.of(context).primaryColor),
                      child: Column(
                        children: [
                          SizedBox(
                            height: isFullScreen(
                              Size(width, height),
                              Size(
                                MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height,
                              ),
                            )
                                ? 0.1 * height
                                : 0.2 * height,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Card(
                              elevation: 20,
                              // shadowColor: Colors.blue,
                              color: Colors.brown[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Enter your credentials",
                                        style: GoogleFonts.poppins(
                                          fontSize: 23,
                                          color:
                                              Colors.black.withOpacity(0.675),
                                          fontWeight: FontWeight.w500,
                                        )),
                                    SizedBox(height: 12),
                                    SingleChildScrollView(
                                      child: Form(
                                        key: widget._formKey,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            FormInput(
                                              inputHeight: 65,
                                              inputWidth: 350,
                                              controller: widget.emailCtrl,
                                              hideInputValue: false,
                                              //prefixIcon: Icons.person,
                                              placeHolder: 'Email',
                                              placeHolderStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Roboto'),
                                              contentPadding: EdgeInsets.only(
                                                  top: 12.5, left: 5),
                                              marginRight: 0,

                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter a valid email';
                                                }
                                                if (!RegExp(
                                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                    .hasMatch(value)) {
                                                  return "Please Enter A valid email";
                                                }
                                                return null;
                                              },
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            FormInput(
                                              inputWidth: 350,
                                              inputHeight: 65,
                                              marginRight: 0,
                                              hideInputValue: true,
                                              controller: widget.passwordCtrl,
                                              // prefixIcon:
                                              placeHolder: "Password",
                                              placeHolderStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Roboto'),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter a your password';
                                                }
                                                if (value.length < 6) {
                                                  return "Please Enter A valid pasword";
                                                }
                                                return null;
                                              },
                                              contentPadding: EdgeInsets.only(
                                                  top: 12.5, left: 5),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            FormInput(
                                              inputWidth: 350,
                                              inputHeight: 65,
                                              marginRight: 0,
                                              hideInputValue: true,
                                              controller:
                                                  widget.confrimPasswordCtrl,
                                              // prefixIcon:
                                              placeHolder: "Confirm Password",
                                              placeHolderStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Roboto'),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please confirm your password';
                                                }
                                                if (value !=
                                                    widget.passwordCtrl.text) {
                                                  return "Password are not matching";
                                                }
                                                return null;
                                              },
                                              contentPadding: EdgeInsets.only(
                                                  top: 12.5, left: 5),
                                            ),
                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                FormInput(
                                                  inputWidth: 155,
                                                  inputHeight: 65,
                                                  marginRight: 0,
                                                  hideInputValue: false,
                                                  controller: widget.nameCtrl,
                                                  // prefixIcon:
                                                  placeHolder: "Name",
                                                  placeHolderStyle: TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: 'Roboto'),
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Please Enter your Name';
                                                    }
                                                    return null;
                                                  },
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          top: 12.5, left: 5),
                                                ),
                                                FormInput(
                                                  inputWidth: 155,
                                                  inputHeight: 65,
                                                  marginRight: 0,
                                                  hideInputValue: false,
                                                  controller: widget.numberCtrl,
                                                  // prefixIcon:
                                                  placeHolder: "Phone ",
                                                  placeHolderStyle: TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: 'Roboto'),
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Please Enter your  Number';
                                                    }
                                                    return null;
                                                  },
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          top: 12.5, left: 5),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    ButtonBuilder(
                                      height: height,
                                      width: width,
                                      color: _color,
                                      text: "Finish Sign Up ",
                                      onTap: () async {
                                        // Validate returns true if the form is valid, otherwise false.
                                        // if (widget._formKey.currentState
                                        //     .validate()) {
                                        //   // If the form is valid, display a snackbar. In the real world,
                                        //   // you'd often call a server or save the information in a database.

                                        //   Scaffold.of(ctx)
                                        //       .showSnackBar(SnackBar(
                                        //     content: Text(
                                        //       'Processing Signup Data',
                                        //       style: TextStyle(
                                        //           color: Colors.white),
                                        //     ),
                                        //     backgroundColor: HexColor("F2A22C"),
                                        //   ));
                                        //   final user = User(
                                        //     email: widget.emailCtrl.text,
                                        //     password: widget.passwordCtrl.text,
                                        //     name: widget.nameCtrl.text,
                                        //     phoneNumber: widget.numberCtrl.text,
                                        //     imageSrc: null,
                                        //   );
                                        //   if (!await viewmodel
                                        //       .checkForDuplicity(user)) {
                                        //     Scaffold.of(ctx)
                                        //         .showSnackBar(SnackBar(
                                        //       content: Text(
                                        //         'Signup successfull',
                                        //         style: TextStyle(
                                        //             color: Colors.white),
                                        //       ),
                                        //       backgroundColor:
                                        //           HexColor("F2A22C"),
                                        //     ));
                                        //     Timer(Duration(seconds: 2),
                                        //         () => viewmodel.addUser(user));
                                        //   } else {
                                        //     Scaffold.of(ctx)
                                        //         .showSnackBar(SnackBar(
                                        //       content: Text(
                                        //         'Email Address is already in use',
                                        //         style: TextStyle(
                                        //             color: Colors.white),
                                        //       ),
                                        //       backgroundColor:
                                        //           HexColor("F2A22C"),
                                        //     ));
                                        //   }
                                        // }

                                        widget.user.email =
                                            widget.emailCtrl.text;

                                        widget.user.password =
                                            widget.passwordCtrl.text;
                                        widget.user.name = widget.nameCtrl.text;
                                        widget.user.phoneNumber =
                                            widget.numberCtrl.text;
                                        await viewmodel.addUser(widget.user);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginScreen(),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    // Container(
                                    //   width: width,
                                    //   child: ElevatedButton.icon(
                                    //     style: ElevatedButton.styleFrom(
                                    //       primary: Colors.blue,
                                    //       onPrimary: Colors.white,
                                    //     ),
                                    //     icon: FaIcon(
                                    //       FontAwesomeIcons.google,
                                    //       color: Colors.red,
                                    //     ),
                                    //     label: Text("Sign Up with Google"),
                                    //     onPressed: () {
                                    //       final googleAuth =
                                    //           Provider.of<GoogleSignInProvider>(
                                    //               context,
                                    //               listen: false);
                                    //       googleAuth.googleLogin();
                                    //     },
                                    //   ),
                                    // ),
                                    SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen(),
                                          ),
                                        );
                                      },
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                           context,
                                           MaterialPageRoute(
                                               builder: (context) => LoginScreen()),
                                          );
                                        },
                                        child: RichText(
                                          text: TextSpan(
                                              style: GoogleFonts.poppins(),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      "Do you have an account?",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: " Log In now",
                                                  style: TextStyle(
                                                      color: Colors.brown[900],
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ));
        },
      ),
    );
  }

//  _buildTextField(String text) {
//    return Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: Container(
//        decoration: BoxDecoration(
//          color: Colors.grey[200],
//          borderRadius: BorderRadius.circular(30.0),
//        ),
//        child: TextField(
//          decoration: InputDecoration(
//              hintText: text,
//              border: InputBorder.none,
//              contentPadding: EdgeInsets.only(left: 20.0)),
//        ),
//      ),
//    );
//  }
}

class ButtonBuilder extends StatelessWidget {
  ButtonBuilder({
    Key key,
    @required this.height,
    @required this.width,
    @required Color color,
    @required this.text,
    @required this.onTap,
  })  : _color = color,
        super(key: key);

  final double height;
  final double width;
  final Color _color;
  final String text;
  var onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 0.075 * height,
            width: 0.8 * width,
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(color: _color),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
