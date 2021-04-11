import 'package:flutter/material.dart';
import 'package:DoctorOnHand/screens/home/components/section_title.dart';
import 'package:DoctorOnHand/screens/specialist/components/specialist_form.dart';
import 'package:DoctorOnHand/screens/home/components/search_field.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
                    SizedBox(height: 30.0),
                    SearchField(),
                     SizedBox(height: 30.0),
                    sectionTitle(text: 'Specialists'),
                    Specialists(),
                      SizedBox(height: 30.0),
                     
                       
                     ],
                   ),
                 ),
               );
             }
           
            
}
