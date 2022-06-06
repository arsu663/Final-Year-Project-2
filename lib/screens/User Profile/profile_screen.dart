import '../../app/main_dependencies.dart';
import 'profile_card.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ConsumerView<LoginViewmodel>(
        initViewmodel: (profileViewmodel) => dependency<LoginViewmodel>(),
        builder: (context, profileViewmodel, __) {
          User user;
          Doctor dr;

          dr = profileViewmodel.dr;
          user = profileViewmodel.user;
          return Scaffold(
            backgroundColor: Colors.brown[200],
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context, user),
              ),
              automaticallyImplyLeading: true,
              flexibleSpace: Container(
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
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
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
                child: ProfileCard(
                    user: user, dr: dr, viewmodel: profileViewmodel),
              ),
            ),
          );
        });
  }
}
