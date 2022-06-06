import '../../app/main_dependencies.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#2A2AC0"),
        actions: [
          // GestureDetector(
          //   child: Icon(Icons.search),
          // )
          IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CategorySearch(),
                );
              })
        ],
        title: Text("Sickness Categories "),
      ),
      body: Column(
        children: <Widget>[
          // Step1
          // here will go the horizontal sliding cards which shows
          // the different categories in the hospital
          Container(
            height: 150.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return HorizontaSicknesslSlidingCard(
                    sicknessName: 'BONE',
                    imageURL: "assets/images/bone.jpg",
                    onPressed: () {},
                  );
                },
                itemCount: 4,
              ),
            ),

            // Step2
            //vertical sliding list that will be rendered depending on the
            //patient choice from the horizontal sliding cards
          )
        ],
      ),
    );
  }
}

class CategorySearch extends SearchDelegate<PatientDashCategory> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text(query);
  }
}
