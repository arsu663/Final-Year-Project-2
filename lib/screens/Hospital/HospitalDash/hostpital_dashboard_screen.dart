import 'package:patientaid/screens/Hospital/HospitalList/hospital_viewmodel.dart';

import '../../../app/main_dependencies.dart';
import 'package:flutter/material.dart';

import 'hospital_viewmodel.dart';

class Hospitaldashboard extends StatefulWidget {
  @override
  _HospitaldashboardState createState() => _HospitaldashboardState();
}

class _HospitaldashboardState extends State<Hospitaldashboard> {
  // List<Doctor> _hDoctors = List<Doctor>();
  List<Category2> _categories = List<Category2>();
  // List<Doctor> _trDoctors = List<Doctor>();

  // _onCellTap(Doctor2 doctor) {}

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  void initState() {
    super.initState();
    // _hDoctors = _getHDoctors();
    _categories = _getCategories();
    // _trDoctors = _getTRDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return SelectorView<HDashboardViewmodel, int>(
        initViewmodel: (doctorViewmodel) => doctorViewmodel.hospital =
            dependency<HospitalListViewmodel>().hospital,
        selector: (_, doctorViewmodel) =>
            doctorViewmodel.busy ? 0 : doctorViewmodel.doctors.length,
            // doctorViewmodel.busy ? 0 : doctorViewmodel.doctors,
        builder: (context, doctorViewmodel, ___) {
          final doctors = doctorViewmodel.doctors;

          return Scaffold(
            appBar: _buildAppBar(),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _hDoctorsSection(doctors, doctorViewmodel),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // _categorySection(),
                        // SizedBox(
                        //   height: 32,
                        // ),
                        // _trDoctorsSection(doctors),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Doctors"),
      backgroundColor: Colors.brown[400],
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.white),
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          size: 14,
        ),
        onPressed: () {},
      ),
      // actions: [
      //   IconButton(
      //     icon: Icon(
      //       Icons.search,
      //       size: 20,
      //     ),
      //     onPressed: () {},
      //   ),
      // ],
    );
  }

  /// Highlighted Doctors Section
  SizedBox _hDoctorsSection(final doctors, HDashboardViewmodel viewmodel) {
    return SizedBox(
      height: 199,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24),
        itemCount: doctors.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(indent: 16),
        itemBuilder: (BuildContext context, int index) => HDCell(
          doctor: doctors[index],
          onTap: () {
            viewmodel.selectDr(index);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DoctorProfile()));
          },
        ),
      ),
    );
  }

  /// Category Section
  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 32,
        ),
        SizedBox(
          height: 100,
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(indent: 16),
            itemBuilder: (BuildContext context, int index) =>
                CategoryCell(category: _categories[index]),
          ),
        ),
      ],
    );
  }

  /// Top Rated Doctors Section
  Column _trDoctorsSection(final doctors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Rated Doctor',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 32,
        ),
        ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemCount: doctors.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            thickness: 16,
            color: Colors.transparent,
          ),
          itemBuilder: (BuildContext context, int index) =>
              TrdCell(doctor: doctors[index]),
        ),
      ],
    );
  }

  /// **********************************************
  /// DUMMY DATA
  /// **********************************************

  /// Get Highlighted Doctors List
  // List<Doctor> _getHDoctors() {
  //   List<Doctor> hDoctors = List<Doctor>();

  //   hDoctors.add(Doctor2(
  //     firstName: 'Omar',
  //     lastName: 'Hamed',
  //     image: 'assets/albert.png',
  //     type: 'Kidney',
  //     rating: 4.5,
  //   ));
  //   hDoctors.add(Doctor2(
  //     firstName: 'Ali',
  //     lastName: 'Hamed',
  //     image: 'assets/albert.png',
  //     type: 'Kidney',
  //     rating: 4.5,
  //   ));

  //   return hDoctors;
  // }

  /// Get Categories
  List<Category2> _getCategories() {
    List<Category2> categories = List<Category2>();
    categories.add(Category2(
      icon: CustomIcons.cardiologist,
      title: 'Cardiologist',
    ));
    categories.add(Category2(
      icon: CustomIcons.eyes,
      title: 'Eyes',
    ));
    categories.add(Category2(
      icon: CustomIcons.pediatrician,
      title: 'Pediatrician',
    ));
    return categories;
  }

  /// Get Top Rated Doctors List
  // List<Doctor2> _getTRDoctors() {
  //   List<Doctor2> trDoctors = List<Doctor2>();

  //   trDoctors.add(Doctor2(
  //     firstName: 'Omar',
  //     lastName: 'Tablawy',
  //     image: 'assets/mathew.png',
  //     type: 'Bone',
  //     rating: 4.3,
  //   ));
  //   trDoctors.add(Doctor2(
  //       firstName: 'Arsalan',
  //       lastName: 'mohamed',
  //       image: 'assets/cherly.png',
  //       type: 'Kidney',
  //       rating: 4.7));
  //   trDoctors.add(Doctor2(
  //       firstName: 'Abdallah',
  //       lastName: 'mahmoud',
  //       image: 'assets/albert.png',
  //       type: 'Kidney',
  //       rating: 4.3));
  //   trDoctors.add(Doctor2(
  //     firstName: 'Omar',
  //     lastName: 'Hamed',
  //     image: 'assets/albert.png',
  //     type: 'Kidney',
  //     rating: 4.5,
  //   ));
  //   return trDoctors;
  // }
}
