import 'dart:convert';
import 'dart:io';
import 'package:DoctorOnHand/api/api.dart';
import 'package:DoctorOnHand/screens/doctordetails/doctordetails_screen.dart';
import 'package:DoctorOnHand/size_config.dart';
import 'package:flutter/material.dart';

class SpecialistDoctor extends StatelessWidget {
  final specid;

  const SpecialistDoctor({Key key, this.specid}) : super(key: key);
  Future getDoctorData() async {
    try {
      var response = await Api().getData('specialists/$specid');
      var doctors = json.decode(response.body)['data'];
      print('........................................');
      print(doctors);
      return doctors;
    } on SocketException {
      return null;
    }
  }







@override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: getDoctorData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Row(
                      children: [
                        ...List.generate(snapshot.data.length, (index) {
                          var mydata = snapshot.data[index];
                          return Container(
                            width: getProportionateScreenWidth(150),
                            child: Card(
                              elevation: 2,
                              shadowColor: Colors.black,
                              color: Color(0xFFf6f6f6),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DoctorDetailsScreen(
                                                  mydata: mydata,
                                                )),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Hero(
                                          tag: mydata["id"],
                                          child: Image(
                                            image: NetworkImage(
                                                mydata["image"]),
                                            height: 100,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RichText(
                                          overflow: TextOverflow.ellipsis,
                                          strutStyle: StrutStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          text: TextSpan(
                                              style: TextStyle(
                                                color: Colors.black45,
                                                 fontWeight: FontWeight.w500,
                                              ),
                                              text: mydata["name"]),
                                        ),
                                        SizedBox(height: 10 ,),
                                        Text(
                                          mydata["specialist"],

                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black45,
                                           
                                          ), //Textstyle
                                        ),
                                      ],
                                    ),
                                  ),
                                  //Text
                                  SizedBox(
                                    height: 10,
                                  ), 
                                  
                                  SizedBox(
                                    height: 10,
                                  ), //SizedBox
                                  SizedBox(
                                    width: getProportionateScreenWidth(100),
                                    height: getProportionateScreenHeight(30),
                                    // child: FlatButton(
                                    //   color: Colors.white,
                                    //   shape: RoundedRectangleBorder(
                                    //     side: BorderSide(
                                    //         color: Color(0xFFB71C1C), width: 2),
                                    //   ),
                                    //   onPressed: () {
                                    //     // Navigator.push(
                                    //     //   context,
                                    //     //   MaterialPageRoute(
                                    //     //       builder: (context) =>
                                    //     //           CheckoutPage(
                                    //     //             totalAmount:
                                    //     //                 mydata["price"],
                                    //     //             totalDiscount:
                                    //     //                 mydata["discount"],
                                    //     //             totalSp:
                                    //     //                 mydata["sellingPrice"],
                                    //     //           )),
                                    //     // );
                                    //   },
                                    //   // child: Padding(
                                    //   //   padding: const EdgeInsets.symmetric(
                                    //   //       vertical: 5.0),
                                    //   //   child: Text(
                                    //   //     'Buy Now',
                                    //   //     style: TextStyle(
                                    //   //         color: Color(0xFFB71C1C)),
                                    //   //   ),
                                    //   // ),
                                    // ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ), //SizedBox
                                ],
                              ), //Padding
                              //SizedBox
                            ),
                          );
                        }),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('Cannot load at this time');
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
