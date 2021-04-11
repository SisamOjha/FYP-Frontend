import 'dart:convert';
import 'dart:io';
import 'package:DoctorOnHand/api/api.dart';
import 'package:DoctorOnHand/size_config.dart';
import 'package:flutter/material.dart';


// class DoctorDetailBody extends StatelessWidget {
//   final mydata;

//   const DoctorDetailBody({Key key, this.mydata}) : super(key: key);

// //   @override
// //   _DoctorDetailBodyState createState() => _DoctorDetailBodyState();
// // }

// // class _DoctorDetailBodyState extends State<DoctorDetailBody> {
//   bool favourites;
  //  Future getFavourite() async {
  //   try {
  //     var response = await Api().getData("favourite/${widget.mydata['id']}");
  //     var doctors = json.decode(response.body)['data'];
  //     print("===========");
  //     //favourite = true;

  //     print(doctors);
  //     return doctors;
  //   } on SocketException {
  //     return null;
  //   }
  // }

   //int favouriteId;

  // Future deleteFavourite() async {
  //   try {
  //     var response = await Api().deleteData("favourite/$favouriteId");
  //     var doctors = json.decode(response.body)['data'];
  //     print("===========");

  //     print(doctors);
  //     return doctors;
  //   } on SocketException {
  //     return null;
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       SizedBox(
  //         height: 20,
  //       ),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           // Icon(Icons.favorite, color:  ,),
  //           Padding(
  //             padding: EdgeInsets.symmetric(
  //                 horizontal: getProportionateScreenWidth(10)),
  //             child: Text(
  //               widget.mydata["name"],
  //               style: TextStyle(fontSize: 17),
  //             ),
  //           ),
  //          Padding(
  //             padding: EdgeInsets.symmetric(
  //                horizontal: getProportionateScreenWidth(10)),
  //             child: IconButton(
  //               icon: Icon(
  //                 Icons.favorite,
  //                 color: Color(0xFFB71C1C),
  //               ),
  //               onPressed: () {
  //                 // Map data = {
  //                 //   'doctor_id': widget.mydata['id'],
  //                 // };
  //                 // var response = await Api().postData(data, 'favourite');
  //                 // print(response.statusCode);
  //               },
  //             ),
  //           ),
              // FutureBuilder(
              //   future: getFavourite(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return Padding(
              //         padding: EdgeInsets.symmetric(
              //             horizontal: getProportionateScreenWidth(10)),
              //         // child: Text(snapshot.data['flags'].toString()),
              //         child: IconButton(
              //           icon: Icon(
              //             Icons.favorite,
              //             color: favourites == true || snapshot.data.length == 1
              //                 ? Colors.red
              //                 : Colors.grey,
              //           ),
              //           onPressed: () async {
              //             if (favourites == false) {
              //               //insert code
              //               Map data = {
              //                 'doctor_id': widget.mydata['id'],
              //                 'flags': 1,
              //               };
              //               var response =
              //                   await Api().postData(data, 'favourite');
              //               print(response.statusCode);
              //               favourites = true;

              //               setState(() {});

              //               print(favourites);
              //             } else {
              //               favourites = false;

              //               print("Deleted");
              //               favouriteId = snapshot.data[0]['id'];
              //               deleteFavourite();
              //               setState(() {});
              //               //delete code

              //             }
              //           },
              //         ),
              //       );
              //     } else {
              //       return CircularProgressIndicator();
              //     }
              //   }),


//           ],
//         ),
          
        

//         SizedBox(height: 20),
        
//         SizedBox(height: 15),
//         Padding(
//           padding:
//               EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
//           child: Text(
//             'Description',
//             style: TextStyle(
//                 fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
//           ),
//         ),
//         SizedBox(height: 15),
//         Padding(
//           padding:
//               EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
//           child: Text(
//             widget.mydata["description"],
//             style: TextStyle(fontSize: 15),
//           ),
//         ),
        
//         SizedBox(
//           height: 15,
//         ),
//       ],
//     );
//   }
// }


//  @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 15,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Icon(Icons.favorite, color:  ,),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: getProportionateScreenWidth(10)),
//               child: Text(
//                 widget.mydata['name'] +', '+ widget.mydata['zone']+', '+widget.mydata['country'] .toString(),
//                 style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,  color: Colors.lightBlue.shade900),

//               ),
//             ),
            
            
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: getProportionateScreenWidth(10)),
//               child: IconButton(
//                 icon: Icon(
//                   Icons.favorite,
//                   color: Color(0xFFB71C1C),
//                 ),
//                 onPressed: () async {
//                   Map data = {
//                     'doctor_id': widget.mydata['id'],
//                   };
//                   var response = await Api().postData(data, 'favourite');
//                   print(response.statusCode);
//                 },
//               ),
//             ),
//           ],
//         ),

//          SizedBox(height: 15),
//           Padding(
//           padding:
//               EdgeInsets.symmetric(
//                 horizontal: getProportionateScreenWidth(10)),
//           child: Text(
//             'Address'+ ': '+'' + widget.mydata['city']+'-'+ widget.mydata['ward'] +', '+ widget.mydata['district'].toString(),
//             style: TextStyle(
//                 fontSize: 18, fontWeight: FontWeight.w600, color: Colors.lightBlue.shade900),
//           ),
//         ),
//          SizedBox(height: 15),   
//        Padding(
//           padding:
//               EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
//           child: Text(
//             'Description',
//             style: TextStyle(
//                 fontSize: 18, fontWeight: FontWeight.w600, color: Colors.blue.shade900,),
//           ),
//         ),
//         SizedBox(height: 15),
//         Padding(
//           padding:
//               EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
//           child: Text(
//             'Hospital is a kind of institution which deals with health care activities. It is an institution that provides treatment to patients. The name of this hospital is '+ widget.mydata["name"]+' .It is located at '+widget.mydata["district"]+' district of '+ widget.mydata["country"] +widget.mydata["description"]+ 'You can contact us at '+ widget.mydata["telephone"].toString(),
//             style: TextStyle(fontSize: 15),
//           ),
//         ),
        
//         SizedBox(
//           height: 15,
//         ),
        
//         SizedBox(height: 15),
//         SizedBox(height: 15),  
        
//       ],
//     );
//   }
// }
// 
// 







class DoctorDetailBody extends StatefulWidget {
  final mydata;

  const DoctorDetailBody({Key key, this.mydata}) : super(key: key);

  @override
  _DoctorDetailBodyState createState() => _DoctorDetailBodyState();
}

class _DoctorDetailBodyState extends State<DoctorDetailBody> {
bool isFavourite = false;

  Future getFavourite() async {
    try {
      var response = await Api().getData("favourite/${widget.mydata['id']}");
      var doctors = json.decode(response.body)['data'];
      print("===========");
      //favourite = true;

      print(doctors);
      return doctors;
    } on SocketException {
      return null;
    }
  }

  int favouriteId;

  Future deleteFavourite() async {
    try {
      var response = await Api().deleteData("favourite/$favouriteId");
      var doctors = json.decode(response.body)['data'];
      print("===========");

      print(doctors);
      return doctors;
    } on SocketException {
      return null;
    }
  }



@override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon(Icons.favorite, color:  ,),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              child: Text(
                widget.mydata['name'] +', '+ widget.mydata['zone']+', '+ widget.mydata['country'] .toString(),
                style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,  color: Colors.lightBlue.shade900),

              ),
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(
                 horizontal: getProportionateScreenWidth(10)),
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Color(0xFFB71C1C),
                ),
                onPressed: () async {
                  Map data = {
                    'doctor_id': widget.mydata['id'],
                  };
                  var response = await Api().postData(data, 'favourite');
                  print(response.statusCode);
                },
              ),
            ),
            
          ],
        ),

         SizedBox(height: 15),
          Padding(
          padding:
              EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
          child: Text(
            'Address'+ ': '+'' + widget.mydata['city']+'-'+ widget.mydata['ward'] +', '+ widget.mydata['district'].toString(),
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.lightBlue.shade900),
          ),
        ),
         SizedBox(height: 15),   
       Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Text(
            'Description',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.blue.shade900,),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Text(
            'The name of this doctor is '+ widget.mydata["name"]+' .  lives at '+widget.mydata["district"]+' district of '+ widget.mydata["country"] + widget.mydata['description'] + 'You can contact at '+ widget.mydata["telephone"].toString(),
            style: TextStyle(fontSize: 15),
          ),
        ),
        
        SizedBox(
          height: 15,
        ),
        
        SizedBox(height: 15),
        SizedBox(height: 15),  
        
      ],
    );
  }
}