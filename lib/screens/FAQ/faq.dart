import 'package:flutter/material.dart';
import 'package:DoctorOnHand/screens/FAQ/components/faqdetails.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: FaqDetails(),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      elevation: 0.1,
      backgroundColor: Colors.white,
      title: Text(
        'CoWare',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => MyProfilePage()));
            }),
        //Text('Back'),
        // IconButton(
        //     icon: Icon(
        //       Icons.arrow_right,
        //       size: 30,
        //       color: Colors.black,
        //     ),
        //     onPressed: () {
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (context) => HomePage()));
        //     }),
      ],
    );
  }
}

