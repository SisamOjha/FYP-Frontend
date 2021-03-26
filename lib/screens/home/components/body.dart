import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'doctor.dart';
import 'home_header.dart';
import 'hospital.dart';
import 'nearbyhospitals.dart';



class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
             NearbyHospitalsHome(),
            SizedBox(height: getProportionateScreenWidth(30)),
            DoctorsHome(),
            SizedBox(height: getProportionateScreenWidth(30)),
            HospitalsHome(),
            SizedBox(height: getProportionateScreenWidth(30)),
            
          ],
        ),
      ),
    );
  }
}
