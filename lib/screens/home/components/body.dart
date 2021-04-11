import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'doctor.dart';
import 'hospital.dart';
import 'home_header.dart';
import 'package:DoctorOnHand/screens/home/components/section_title.dart';




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
                       
                     sectionTitle(text: 'Doctors', view: () {}),
                     DoctorsHome(),
                     SizedBox(height: 30.0),
                    
                    sectionTitle(text: 'Hospitals', view: () {}),
                    HospitalsHome(),
                      SizedBox(height: 30.0),
                   
                       
                     ],
                   ),
                 ),
               );
             }
           
            
}
