import 'dart:convert';
import 'dart:io';

import 'package:DoctorOnHand/api/api.dart';
import 'package:flutter/material.dart';


import '../../../size_config.dart';

class FaqDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //get faqs data
    Future getFaqs() async {
      try {
        var response = await Api().getData('faqs');
        var category = json.decode(response.body)['data'];
        print(category);
        return category;
      } on SocketException {
        return null;
      }
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.help, color: Colors.black), onPressed: null),
              Container(
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.only(top: 1.0, left: 0.0, bottom: 5.0),
                child: Text(
                  'FAQS',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 1.0, left: 12.0, bottom: 5.0),
            child: Text(
              'Solve your queries here !!',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFB71C1C),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: getFaqs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var mydata = snapshot.data[index];

                      return InkWell(
                          onTap: () {
                            print('faq pressed');
                          },
                          child: Card(
                            elevation: 2,
                            child: ListTile(
                              //leading: Text(mydata['id'].toString()),
                              title: Text(
                                mydata['question'],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFFB71C1C),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: RichText(
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(fontSize: 10.0),
                                text: TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    text: mydata['answer']),
                              ),
                            ),
                          ));
                    },
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
          ),
        ],
      ),
    );
  }
}
