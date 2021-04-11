import'package:DoctorOnHand/screens/doctordetails/components/DoctorDetailbody.dart';
import 'package:DoctorOnHand/screens/doctordetails/components/doctordetailImage.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../size_config.dart';



class DoctorDetailsScreen extends StatefulWidget {
   //static String routeName = "/details";
   const DoctorDetailsScreen({Key key, this.mydata}) : super(key: key);

  final mydata;

  @override
  _DoctorDetailsScreenState createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
   int selectedImage;
  var newList;
  
  

  @override
  void initState() {
    super.initState();
    buildSmallDoctorPreview(context);
  }

  Widget buildSmallDoctorPreview(BuildContext context) {
    return Column(
      children: [
        
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/detail_illustration.png'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column (
            children: <Widget>[
              SizedBox(
                height: 12,
              ),
               Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                   
                  child: IconButton(
                    
                    onPressed: (){
                      Navigator.pop(context);

                    },
                    
                    icon:Icon(Icons.arrow_back)
                      
                  

                    ),
                     
                    ),
                    
                  ],
                ),
              ),
                SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
              ),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(60),
                  ),
                ),
                 child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
          children: [
            
            DoctorDetailImage(
              tag: widget.mydata["id"].toString(),
              image: widget.mydata['image'],
            ),
            SizedBox(height: 0.00001),
            DoctorDetailBody(
              mydata: widget.mydata,
            ),
          ],
        ),
                 )
           
             ),
             ],
        ),
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


// import 'package:flutter/material.dart';

// import 'components/DoctorDetailbody.dart';
// import 'components/doctordetailImage.dart';


// class DoctorDetailsScreen extends StatefulWidget {
//    //static String routeName = "/details";
//    const DoctorDetailsScreen({Key key, this.mydata}) : super(key: key);

//   final mydata;

//   @override
//   _DoctorDetailsScreenState createState() => _DoctorDetailsScreenState();
// }

// class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
//    int selectedImage;
//   var newList;
  
//   bool isFavourite = false;

//   @override
//   void initState() {
//     super.initState();
//     buildSmallDoctorPreview(context);
//   }

//   Widget buildSmallDoctorPreview(BuildContext context) {
//     return Column(
//       children: [
        
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.5,
//         backgroundColor: Colors.white,
//         title: Text(
//           'Back',
//           style: TextStyle(
//             fontFamily: 'Montserrat',
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
        
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
            
//             DoctorDetailImage(
//               tag: widget.mydata["id"].toString(),
//               image: widget.mydata['image'],
//             ),
         
          
//             SizedBox(height: 1),
//             DoctorDetailBody(
//               mydata: widget.mydata,
//             ),
//           ],
//         ),
//       ),
    
    
//     );
//   }             

//   OutlineButton buildOutlineButton({Function press, IconData icon}) {
//     return OutlineButton(
//       padding: EdgeInsets.zero,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(13),
//       ),
//       onPressed: press,
//       child: Icon(icon),
//     );
//   }
// }












