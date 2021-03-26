import 'dart:convert';

import 'package:DoctorOnHand/api/api.dart';
import 'package:DoctorOnHand/components/hospital_card.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class HospitalsHome extends StatelessWidget {
  //Get Hospitals data
  Future getHospitalsData() async {
    var response = await Api().getData('hospitals');
    var data = json.decode(response.body)['data'];
    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                   
                   return Card(
                  elevation: 2.0,
                  child: InkWell(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width / 2,
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(
                              image:
                                  NetworkImage(snapshot.data[index]['image']),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          snapshot.data[index]['name'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        
                        SizedBox(
                          height: 20,
                        ),
                        // OutlinedButton.icon(
                        //   icon: Icon(
                        //     Icons.shop_rounded,
                        //     color: Colors.black,
                        //   ),
                        //   label: Text(
                        //     "Buy Now",
                        //     style: TextStyle(
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        //   onPressed: () => print("it's pressed"),
                        //   style: ElevatedButton.styleFrom(
                        //     side: BorderSide(width: 2.0, color: Colors.black),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(32.0),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    onTap: () {
                     Navigator.push(
                         context,
                          MaterialPageRoute(
                              builder: (context) => HospitalCard()));
                    },
                  ),
                );
                  }
                      

                      ),

                
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
    );
  }
}
