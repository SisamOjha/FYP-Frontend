import 'dart:convert';
import 'package:DoctorOnHand/api/api.dart';
import 'package:DoctorOnHand/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Maps",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
             press: () async {
              Map data = {};
              var response = await Api().logOut(data, 'logout');
              var result = json.decode(response.body);
              if (result['code'] == 200) {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.remove('token');
                Navigator.popAndPushNamed(context, SignInScreen.routeName);
              } else {
                print(result['code']);
              }
              // print(result['code']);
            },
            
          ),
        ],
      ),
    );
  }
}
