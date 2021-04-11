import 'package:DoctorOnHand/api/api.dart';
import 'package:DoctorOnHand/screens/home/components/searchitem.dart';
import 'package:DoctorOnHand/screens/hospitaldetail/Hospitaletails_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class SearchModel extends SearchDelegate<String> {
  //int count = 1;

  //Get Hospitals data
  Future getHospitalsData(String query) async {
    var response = await Api().getData('searchHospital?name=$query');
    var data = json.decode(response.body);

    print(data);
    return data;
  }
 @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
      body: Search(query: query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getHospitalsData(query),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, int index) {
                  var mydata = snapshot.data[index];
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search'),
                  );
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HospitalDetailsScreen()));
                    
                    },
                    // leading: Icon(
                    //   Icons.settings_system_daydream,
                    //   color: Colors.black,
                    // ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                         "http://192.168.100.210:8000/" +
                             snapshot.data[index]['image']),
                    ),
                    title: Text(mydata['name'],
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500)),
                    trailing: Icon(Icons.arrow_forward),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error');
            } else {
              return Text('Loading');
            }
          },
        ),
      ),
    );
  }
}
