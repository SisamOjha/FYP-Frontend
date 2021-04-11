import 'dart:convert';
import 'dart:io';

import 'package:DoctorOnHand/size_config.dart';
import 'package:flutter/material.dart';
import 'package:DoctorOnHand/api/api.dart';
import 'hospitaldetails/hospitalDetails.dart';






class HospitalCard extends StatelessWidget {
  Future getHospitalData() async {
    try {
      var response = await Api().getData('hospitals');
      var hospitals = json.decode(response.body)['data'];
      print("===========");

      return hospitals;
    } on SocketException {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
            future: getHospitalData(),
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
                                            HospitalDetailScreen(
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
                                            mydata["featureImage"]),
                                        height: 70,
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
                                          ),
                                          text: mydata["name"]),
                                    ),
                                    //SizedBox
                                    // Text(
                                    //   mydata["name"],

                                    //   textAlign: TextAlign.center,
                                    //   style: TextStyle(
                                    //     fontSize: 14,
                                    //     color: Colors.black45,
                                    //     fontWeight: FontWeight.w500,
                                    //   ), //Textstyle
                                    // ),
                                  ],
                                ),
                              ),
                              //Text
                              SizedBox(
                                height: 10,
                              ), //SizedBox
                              Text(
                                'Rs: ' + mydata["price"].toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF6c63ff),
                                    fontWeight: FontWeight.bold), //Textstyle
                              ), //Text
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
                                //         color: kPrimaryColor, width: 2),
                                //   ),
                                //   // onPressed: () {
                                //   //   Navigator.push(
                                //   //     context,
                                //   //     MaterialPageRoute(
                                //   //         builder: (context) => CheckOut(
                                //   //               totalAmount: mydata["price"],
                                //   //               totalDiscount:
                                //   //                   mydata["discount"],
                                //   //               totalSp: mydata["sellingPrice"],
                                //   //             )),
                                //   //   );
                                //   // },
                                //   child: Padding(
                                //     padding: const EdgeInsets.symmetric(
                                //         vertical: 5.0),
                                //     child: Text(
                                //       'Buy Now',
                                //       style: TextStyle(color: kPrimaryColor),
                                //     ),
                                //   ),
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
    );
  }
}
