import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:DoctorOnHand/api/api.dart';
import 'package:DoctorOnHand/screens/specialist/specialistdoctor.dart';



class Specialists extends StatelessWidget {
  Future getSpecialistData() async {
    try {
      var response = await Api().getData('specialists');
      var specialist = json.decode(response.body)['data'];
      print(specialist);
      return specialist;
    } on SocketException {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Container(
              height: 900,
              child: FutureBuilder(
                future: getSpecialistData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
                      crossAxisCount: 2,
                      //physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(left:10.0),
                      children: [
                        ...List.generate(snapshot.data.length, (index) {
                          var mydata = snapshot.data[index];
                          

                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 10.0, bottom: 10.0, right: 0.0),
                            child: InkWell(
                              onTap: () {
                                print('Specialist pressed');
                                Navigator.push(context,
                                MaterialPageRoute(
                                  builder:(context) => SpecialistDoctor(specid: mydata['id'].toString(), )
                                ),
                            );
                              },
                              
                              child: Container(
                                width: 100,
                                // width: getProportionateScreenWidth(100),
                                // height: getProportionateScreenHeight(70),
                                child: Column(
                                  children: [
                                    Card(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.network(
                                        mydata['image'],
                                        fit: BoxFit.fill,
                                        height: 80,
                                        // height: getProportionateScreenHeight(80),
                                      ),
                                    ),
                                    Text(
                                      mydata['name'],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                            // if (mydata[index].isPopular)

                            // return SizedBox
                            //     .shrink(); // here by default width and height is 0
                            // return ProductCard(product: mydata);
                            // return Column(
                            //   children: [Text(snapshot.data[index]['name'])],
                            // );5
                            // return Text(mydata.length.toString());

                            ),
                        SizedBox(width: 20),
                        // SizedBox(width: getProportionateScreenWidth(20)),
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
            ),
          ),
        
      );
    
  }
}



