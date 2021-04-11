
import 'package:flutter/material.dart';
import 'package:DoctorOnHand/screens/hospitaldetail/components/hospitaldetailImage.dart';
import 'package:DoctorOnHand/screens/hospitaldetail/components/HospitalDetailbody.dart';

class HospitalDetailsScreen extends StatefulWidget {
   //static String routeName = "/details";
   const HospitalDetailsScreen({Key key, this.mydata}) : super(key: key);

  final mydata;

  @override
  _HospitalDetailsScreenState createState() => _HospitalDetailsScreenState();
}

class _HospitalDetailsScreenState extends State<HospitalDetailsScreen> {
   int selectedImage;
  var newList;
  
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    buildSmallHospitalPreview(context);
  }

  Widget buildSmallHospitalPreview(BuildContext context) {
    return Column(
      children: [
        
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          'Back',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            HospitalDetailImage(
              tag: widget.mydata["id"].toString(),
              image: widget.mydata['image'],
            ),
         
          
            SizedBox(height: 1),
            HospitalDetailBody(
              mydata: widget.mydata,
            ),
          ],
        ),
      ),
    
    
    );
  }             

  OutlineButton buildOutlineButton({Function press, IconData icon}) {
    return OutlineButton(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      onPressed: press,
      child: Icon(icon),
    );
  }
}












