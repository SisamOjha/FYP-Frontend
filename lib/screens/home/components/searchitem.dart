import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:DoctorOnHand/Api/api.dart';

class Search extends StatefulWidget {
  final query;

  const Search({Key key, this.query}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //Get hospital data
  Future getHospitalData(String query) async {
    var response = await Api().getData('searchHospital?name=$query');
    var data = json.decode(response.body);
    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getHospitalData(widget.query),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var mydata = snapshot.data[index];
                return Text(mydata['name']);
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error');
          } else {
            return Text('Loading');
          }
        },
      ),
    );
  }
}
