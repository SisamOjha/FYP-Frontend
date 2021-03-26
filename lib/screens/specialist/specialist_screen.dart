import 'package:DoctorOnHand/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';


import '../../enums.dart';
import 'components/body.dart';

class SpecialistScreen extends StatelessWidget {
  static String routeName = "/specialist";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpecialistPageScreen(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.specialist),
    );
  }
}

