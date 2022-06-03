// import 'package:flutter/rendering.dart';
// import 'package:patientaid/screens/Hospital/HospitalList/hospital_viewmodel.dart';

// import '../../../app/main_dependencies.dart';

// class HospitalMap extends StatefulWidget {
//   @override
//   _HospitalMapState createState() => _HospitalMapState();
// }

// class _HospitalMapState extends State<HospitalMap> {
//   Completer<GoogleMapController> _controller = Completer();
//   @override
//   void initState() {
//     super.initState();
//   }

//   double zoomVal = 5.0;
//   @override
//   Widget build(BuildContext context) {
//     return ConsumerView<HospitalListViewmodel>(
//         initViewmodel: (hospitalsviewmodel) =>
//             hospitalsviewmodel.getHospitals(),
//         builder: (context, hospitalsviewmodel, __) {
//           List<Hospital> hospital = hospitalsviewmodel.hospitals;

//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: HexColor("#2A2AC0"),
//               leading: IconButton(
//                 icon: Icon(
//                   Icons.arrow_left,
//                   size: 45,
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => PatientDashboardScreen(),
//                       ));
//                 },
//               ),
//               title: Center(
//                 child: Text("Nearby Hospitals"),
//               ),
//               actions: <Widget>[
//                 IconButton(
//                   icon: Icon(
//                     Icons.search,
//                     size: 35,
//                   ),
//                   onPressed: () {},
//                 )
//               ],
//             ),
//             body: Stack(
//               children: <Widget>[
//                 _googlemap(context),
//                 _zoominfunction(),
//                 _zoomoutfunction(),
//                 _buildCards(hospital,hospitalsviewmodel),
//               ],
//             ),
//           );
//         });
//   }

//   Widget _zoomoutfunction() {
//     return Align(
//       alignment: Alignment.topLeft,
//       child: IconButton(
//           icon:
//               Icon(Icons.zoom_out_rounded, size: 50, color: Color(0xff6200ee)),
//           onPressed: () {
//             zoomVal--;
//             _minus(zoomVal);
//           }),
//     );
//   }

//   Widget _zoominfunction() {
//     return Align(
//       alignment: Alignment.topRight,
//       child: IconButton(
//           icon: Icon(Icons.zoom_in_rounded, size: 50, color: Color(0xff6200ee)),
//           onPressed: () {
//             zoomVal++;
//             _plus(zoomVal);
//           }),
//     );
//   }

//   Future<void> _minus(double zoomVal) async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(target: LatLng(1.47784, 103.74029), zoom: zoomVal)));
//   }

//   Future<void> _plus(double zoomVal) async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(target: LatLng(1.47784, 103.74029), zoom: zoomVal)));
//   }

//   Widget _googlemap(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child: GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: CameraPosition(
//           target: LatLng(1.46643, 103.72604),
//           zoom: 12,
//         ),
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//         markers: {
//           SultanahAminahHospitalMarker,
//           KPJHospitalMarker,
//           KPJPuteriHospitalMarker,
//           ColumbiaAsiaHospitalMarker,
//           MariaHospitalMarker,
//           HsaRoyalHospitalMarker,
//         },
//       ),
//     );
//   }

//   Widget _buildCards(List<Hospital> hospital,HospitalListViewmodel viewmodel) {
//     return Align(
//       alignment: Alignment.bottomLeft,
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 20.0),
//         height: 150.0,
//         child: ListView.separated(
//           separatorBuilder: (context ,index)=>SizedBox(width:10),
//           itemCount: 3,
//           itemBuilder: (context, index) => _mapsCards(
//             viewmodel,
//             hospital[index].hospitalName,
//             hospital[index].imageURL,
//             hospital[index].latitude,
//             hospital[index].longitude,
//             index
//           ),
//           scrollDirection: Axis.horizontal,
//           //children: <Widget>[
//           //  SizedBox(
//           //    width: 10.0,
//           //  ),
//           //  Padding(
//           //    padding: const EdgeInsets.all(8.0),
//           //    child: _mapsCards(
//           //        "assets/logo.png", 1.47784, 103.74029, "KPJ Hospital"),
//           //  ),
//           //  SizedBox(width: 10.0),
//           //  Padding(
//           //    padding: const EdgeInsets.all(8.0),
//           //    child: _mapsCards("assets/columbia.png", 1.50178, 103.76578,
//           //        "Columbia Hospital"),
//           //  ),
//           //  SizedBox(width: 10.0),
//           //  Padding(
//           //    padding: const EdgeInsets.all(8.0),
//           //    child: _mapsCards(
//           //        "assets/hsa.png", 1.46008, 103.74656, "HsaRoyal Hospital"),
//           //  ),
//           //  SizedBox(width: 10.0),
//           //  Padding(
//           //    padding: const EdgeInsets.all(8.0),
//           //    child: _mapsCards(
//           //        "assets/maria.png", 1.46755, 103.75960, "Maria Hospital"),
//           //  ),
//           //],
//         ),
//       ),
//     );
//   }

//   Widget _mapsCards(HospitalListViewmodel viewmodel,
//       String hospitalName, String imageUrl, double latitude, double longitude,int index) {
//     return GestureDetector(
//       onTap: () {
//         viewmodel.selectHospital(index);
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => Hospitaldashboard()));
//       },
//       onDoubleTap: () {
//         _gotoLocation(latitude, longitude);
//       },
//       child: Container(
//           child: new FittedBox(
//         child: Material(
//           color: Colors.white,
//           elevation: 14.0,
//           borderRadius: BorderRadius.circular(24.0),
//           shadowColor: Color(0x802196f3),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Container(
//                 width: 180,
//                 height: 200,
//                 child: ClipRRect(
//                   borderRadius: new BorderRadius.circular(24.0),
//                   child: Image(
//                     image: NetworkImage(imageUrl),
//                   ),
//                 ),
//               ),
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: myDetailsContainer(hospitalName),
//                 ),
//               )
//             ],
//           ),
//         ),
//       )),
//     );
//   }

//   Future<void> _gotoLocation(double latitude, double longitude) async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//       target: LatLng(latitude, longitude),
//       zoom: 15,
//       tilt: 50.0,
//       bearing: 45.0,
//     )));
//   }

//   Widget myDetailsContainer(String hospitalName) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Text(
//             hospitalName,
//             style: TextStyle(
//                 color: HexColor("#2A2AC0"),
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold),
//           )),
//         ),
//         SizedBox(height: 5.0),
//         Container(
//             child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Container(
//                 child: Text(
//               "4.1",
//               style: TextStyle(
//                 color: Colors.black54,
//                 fontSize: 18.0,
//               ),
//             )),
//             Container(
//               child: Icon(
//                 Icons.star,
//                 color: Colors.amber,
//                 size: 15.0,
//               ),
//             ),
//             Container(
//               child: Icon(
//                 Icons.star,
//                 color: Colors.amber,
//                 size: 15.0,
//               ),
//             ),
//             Container(
//               child: Icon(
//                 Icons.star,
//                 color: Colors.amber,
//                 size: 15.0,
//               ),
//             ),
//             Container(
//               child: Icon(
//                 Icons.star,
//                 color: Colors.amber,
//                 size: 15.0,
//               ),
//             ),
//             Container(
//               child: Icon(
//                 Icons.star,
//                 color: Colors.amber,
//                 size: 15.0,
//               ),
//             ),
//             Container(
//                 child: Text(
//               "(946)",
//               style: TextStyle(
//                 color: Colors.black54,
//                 fontSize: 18.0,
//               ),
//             )),
//           ],
//         )),
//         SizedBox(height: 5.0),
//         Container(
//             child: Text(
//           "Medical \u00B7 \u0024\u0024 \u00B7 1.6 mi",
//           style: TextStyle(
//             color: Colors.black54,
//             fontSize: 18.0,
//           ),
//         )),
//         SizedBox(height: 5.0),
//         Container(
//             child: Text(
//           "Closed \u00B7 Opens 06:00 ",
//           style: TextStyle(
//               color: Colors.black54,
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold),
//         )),
//       ],
//     );
//   }
// }

// Marker SultanahAminahHospitalMarker = Marker(
//   markerId: MarkerId('SultanaAminah'),
//   position: LatLng(1.46034, 103.74579),
//   infoWindow: InfoWindow(title: 'SultanahAminah Hospital'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueBlue,
//   ),
// );
// Marker KPJHospitalMarker = Marker(
//   markerId: MarkerId('KPJ'),
//   position: LatLng(1.47784, 103.74029),
//   infoWindow: InfoWindow(title: 'KPJ Hospital'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueBlue,
//   ),
// );
// Marker KPJPuteriHospitalMarker = Marker(
//   markerId: MarkerId('KPJ Puteri'),
//   position: LatLng(1.49226, 103.74209),
//   infoWindow: InfoWindow(title: 'KPJ Puteri Hospital'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueBlue,
//   ),
// );
// Marker ColumbiaAsiaHospitalMarker = Marker(
//   markerId: MarkerId('Columbia'),
//   position: LatLng(1.50178, 103.76578),
//   infoWindow: InfoWindow(title: 'ColumbiaAsia Hospital'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueBlue,
//   ),
// );
// Marker MariaHospitalMarker = Marker(
//   markerId: MarkerId('Maria'),
//   position: LatLng(1.46755, 103.75960),
//   infoWindow: InfoWindow(title: 'Maria Hospital'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueBlue,
//   ),
// );
// Marker HsaRoyalHospitalMarker = Marker(
//   markerId: MarkerId('HSA'),
//   position: LatLng(1.46008, 103.74656),
//   infoWindow: InfoWindow(title: 'HsaRoyal Hospital'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueBlue,
//   ),
// );
