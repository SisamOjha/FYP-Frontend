import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:DoctorOnHand/Api/api.dart';

class FavouriteCard extends StatelessWidget {
  
  Future getWishlist() async {
    try {
      var response = await Api().getData('favourite');
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
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 700,
            child: FutureBuilder(
                future: getWishlist(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          var alldata = snapshot.data[index];
                          return Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              

                              
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 0.0,
                                    left: 10.0,
                                    bottom: 10.0,
                                    right: 10.0),
                                height: 180,
                                child: Card(
                                  elevation: 2.0,
                                  child: InkWell(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 180,
                                          padding: EdgeInsets.all(30),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "http://192.168.41.178:8000/" +
                                                      snapshot.data[index]
                                                          ['image']),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 30,
                                              top: 30.0,
                                              bottom: 10.0,
                                              right: 380.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                snapshot.data[index]['name'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              
                                              SizedBox(
                                                height: 8,
                                              ),
                                              
                                              SizedBox(
                                                height: 12,
                                              ),
                                              
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text('Cannot load');
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )),
    );
  }
}