// import 'dart:convert';

// import 'package:DoctorOnHand/api/api.dart';
// import 'package:DoctorOnHand/models/hotel_model.dart';
// import 'package:DoctorOnHand/screens/details/details_screen.dart';
// import 'package:flutter/material.dart';

// import '../../../size_config.dart';


// class NearbyHospitalsHome extends StatelessWidget {
//   //Get Doctors data
//   Future getproductsData() async {
//     var response = await Api().getData('poctors');
//     var data = json.decode(response.body)['data'];
//     print(data);
//     return data;
//   }

//         @override
//         Widget build(BuildContext context) {
//     return Column(
//       children: [
//         FutureBuilder(
//           future: getproductsData(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Row(
//                 children: [
//                   // Text(mydata['name']),
//                   ...List.generate(snapshot.data.length, (index) {
//                     var mydata = snapshot.data[index];
//                     return Padding(
//                       padding: EdgeInsets.only(
//                           left: getProportionateScreenWidth(20)),
//                       child: SizedBox(
//                         width: getProportionateScreenWidth(140),
//                         child: GestureDetector(
//                           onTap: () => Navigator.pushNamed(
//                             context,
//                             DetailsScreen.routeName,
//                             //arguments: DoctorDetailsArguments(Doctor: mydata),
//                           ),
//                child: Column(
//                  children: [
//                    Container(
//           height: 300.0,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: hospitals.length,
//             itemBuilder: (BuildContext context, int index) {
//               Hospital hospital = hospitals[index];
//               return Container(
//                     margin: EdgeInsets.all(10.0),
//                     width: 240.0,
//                     child: Stack(
//                       alignment: Alignment.topCenter,
//                       children: <Widget>[
//                         Positioned(
//                           bottom: 15.0,
//                           child: Container(
//                             height: 120.0,
//                             width: 240.0,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.all(10.0),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: <Widget>[
//                                   Text(
//                                     hospital.name,
//                                     style: TextStyle(
//                                       fontSize: 15.0,
//                                       fontWeight: FontWeight.w600,
//                                       letterSpacing: 1.2,
//                                     ),
//                                   ),
//                                   SizedBox(height: 1.0),
//                                   Text(
//                                     hospital.address,
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                   SizedBox(height: 2.0),
                                  
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20.0),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black26,
//                                 offset: Offset(0.0, 2.0),
//                                 blurRadius: 2.0,
//                               ),
//                             ],
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(20.0),
//                             child: Hero(
//                                     tag: mydata['id'].toString(),
//                                     child: Image.network(
//                                       mydata['image'],
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                           ),
//                         )
//                       ],
//                     ),
//               );
//             },
//           ),
//         ),
//                  ],
//                ),
//        ),
//                       ),
//                     );
//                   }
//                       ),

//                   SizedBox(width: getProportionateScreenWidth(20)),
//                 ],
//               );
              
//             } else if (snapshot.hasError) {
//               return Text('Cannot load at this time');
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//       ],
//     );
//   }

// }
// //       ],
// //     );
// //   }
// // }
import 'dart:convert';

import 'package:DoctorOnHand/api/api.dart';
import 'package:DoctorOnHand/models/hotel_model.dart';
import 'package:flutter/material.dart';


class NearbyHospitalsHome extends StatelessWidget {
 //Get Doctors data
  Future getproductsData() async {
    var response = await Api().getData('poctors');
    var data = json.decode(response.body)['data'];
    print(data);
    return data;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Nearby Hospitals',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: () => print('See All'),
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hospitals.length,
            itemBuilder: (BuildContext context, int index) {
              Hospital hospital = hospitals[index];
              return Container(
                margin: EdgeInsets.all(10.0),
                width: 240.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      bottom: 15.0,
                      child: Container(
                        height: 120.0,
                        width: 240.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                hospital.name,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(height: 1.0),
                              Text(
                                hospital.address,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          height: 180.0,
                          width: 220.0,
                          image: AssetImage(hospital.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

