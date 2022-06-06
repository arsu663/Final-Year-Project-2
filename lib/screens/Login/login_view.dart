import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../app/main_dependencies.dart';
// import '../../user_notifier.dart';

class LoginScreen extends StatefulWidget {
  User user;
  bool showPassword = false;

  static const String route = "/LoginPage";
  // LoginScreen(this.users);
  final _formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          height = constraints.maxHeight;
          width = constraints.maxWidth;
          return Scaffold(
              body: ChangeNotifierProvider.value(
            value: dependency<LoginViewmodel>(),
            child: Consumer<LoginViewmodel>(
              builder: (context, viewmodel, _) {
                return Builder(
                  builder: (ctx) => SingleChildScrollView(
                    child: Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        color: _color,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: isFullScreen(
                              Size(width, height),
                              Size(MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height),
                            )
                                ? 0.0 * height
                                : 0.2 * height,
                          ),
                          Expanded(
                            child: Container(
                              width: width,
                              height: 150,
                              color: Colors.transparent,
                              child: Image.asset(
                                "assets/logo.png",
                                height: 100,
                                width: width,
                              ),
                            ),
                          ),
                          SizedBox(
                              height: isFullScreen(
                            Size(width, height),
                            Size(MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height),
                          )
                                  ? (0.1 * height)
                                  : (0.02 * height)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 50),
                            child: Card(
                              elevation: 20,
                              shadowColor: Colors.blue,
                              color: Colors.brown[100],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
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
                                          children: [
                                            FormInput(
                                              inputHeight: 65,
                                              inputWidth: 350,
                                              controller: widget.emailCtrl,
                                              hideInputValue: false,
                                              icon: Icon(Icons.person),
                                              placeHolder: 'Email',
                                              placeHolderStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Roboto'),
                                              contentPadding:
                                                  EdgeInsets.only(top: 13.0),
                                              marginRight: 0,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter a valid email';
                                                }
                                                return null;
                                              },
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            FormInput(
                                              inputHeight: 65,
                                              inputWidth: 350,
                                              controller: widget.passwordCtrl,
                                              hideInputValue: true,
                                              icon: Icon(Icons.lock),
                                              placeHolder: 'Password',
                                              placeHolderStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Roboto'),
                                              contentPadding:
                                                  EdgeInsets.only(top: 13.0),
                                              marginRight: 0,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter your password';
                                                }
                                                return null;
                                              },
                                            ),
                                            if (viewmodel.showErrorMessage ==
                                                true)
                                              Center(
                                                child: Text(
                                                  "Invalid user name or passwrod",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    _buildbutton(context, viewmodel),
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
                                      child: RichText(
                                        text: TextSpan(
                                          style: GoogleFonts.poppins(),
                                          children: [
                                            TextSpan(
                                              text: "Don't have an account?",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " Sign Up now",
                                              style: TextStyle(
                                                  color: Colors.brown[900],
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
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

  InkWell _buildbutton(BuildContext context, LoginViewmodel viewmodel) {
    return InkWell(
      onTap: () {
        _onLogin(context, viewmodel);
      },
      child: Container(
        height: 0.075 * height,
        width: 0.8 * width,
        decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: _color,
          ),
        ),
        child: Center(
          child: Text(
            "Log in",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void _onLogin(BuildContext context, LoginViewmodel viewmodel) async {
    viewmodel.username = widget.emailCtrl.text;
    viewmodel.password = widget.passwordCtrl.text;
    final User _user = await viewmodel.login();

    final Doctor _doctor = await viewmodel.checkType();

    if (_user != null) {
      viewmodel.user = _user;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PatientDashboardScreen(),
        ),
      );
    } else if (_doctor != null) {
      viewmodel.dr = _doctor;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DoctorDashboardScreen(doctor: viewmodel.dr),
        ),
      );
    } else {
      viewmodel.showErrorMessage = true;
    }
  }
}
