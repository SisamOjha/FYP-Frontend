import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  String baseUrl = 'http://192.168.100.210:8000/api/';

  //Getting data 
  Future getData(String endPoint) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString('token');
    String url = baseUrl + endPoint;
    var response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response;
    
  }

  //for signin
  Future loginRegister(Map data, String endPoint) async {
    String url = baseUrl + endPoint;
    var response = await http.post(url,
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json'
        },
        body: jsonEncode(data));
    return response;
  }

  //for signup

 Future signupRegister(Map data, String endPoint) async {
    String url = baseUrl + endPoint;
    var response = await http.post(url,
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json'
        },
        body: jsonEncode(data));
    return response;
  }

  //for logout 
  Future logOut(Map data, String endPoint) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString('token');
    String url = baseUrl + endPoint;
    var response = await http.post(url,
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(data));
    return response;
  }
}
