import 'dart:convert';
import 'dart:io';
import 'package:DoctorOnHand/api/api.dart';
import 'package:DoctorOnHand/screens/hospitaldetail/Hospitaletails_screen.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';



class HospitalsHome extends StatefulWidget {
  static String routeName = "/hospitals";
  //Get Products data
  @override
  _HospitalsHomeState createState() => _HospitalsHomeState();
}

class _HospitalsHomeState extends State<HospitalsHome> {
  
  Future getHospitalsData() async {
      // ignore: unused_local_variable
      List<dynamic> hospitals = [];
      try {
    var response = await Api().getData('hospitals');
    var hospitals = json.decode(response.body)['data'];
    print(hospitals);
    return hospitals;
  }
  on SocketException {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
       child: Column(
      children: [
        FutureBuilder(
          future: getHospitalsData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Row(
                children: [
                  // Text(mydata['name']),
                  ...List.generate(snapshot.data.length, (index) {
                    var mydata = snapshot.data[index];
                   return Padding(
                        padding: const EdgeInsets.only(
                            top: 25.0, left: 10.0, bottom: 10.0, right: 0.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HospitalDetailsScreen(
                                       mydata: mydata, 
                                      )),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF656565).withOpacity(0.15),
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                  )
                                ]),
                            child: Wrap(
                              children: <Widget>[
                                Container(
                                  width: 200.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            height: 185.0,
                                            width: 160.0,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(7.0),
                                                    topRight:
                                                        Radius.circular(7.0)),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        mydata['image']),
                                                    fit: BoxFit.cover)),
                                          ),
                                         
                                             
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top:
                                                  // top: getProportionateScreenHeight(
                                                  7.0)),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, right: 15.0),
                                        child: Text(
                                          mydata['name'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              letterSpacing: 0.6,
                                              color: kPrimaryColor,
                                              fontFamily: "Sans",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 1.0)),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 3.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0,
                                                          right: 15.0),
                                                  child: Text(
                                                    'Address-' +
                                                        mydata['city']
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontFamily: "Sans",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14.0),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0,
                                                          right: 15.0,
                                                          top: 5.0,
                                                          bottom: 10),
                                                ),
                                              ],
                                            ),
                                          
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );




                  }



                      ),

                  SizedBox(width: getProportionateScreenWidth(20)),
                ],
              );
              // return Text(mydata.length.toString());
              // return Text(snapshot.data[0]['discount'].toString());
              // return ListView.builder(
              //   physics: NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   itemCount: snapshot.data.length,
              //   itemBuilder: (context, index) {
              //     var mydata = snapshot.data[index];
              //     return Text(mydata['discount'].toString());
              //   },
              // );
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
