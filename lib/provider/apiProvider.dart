// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/widgets.dart';
// import 'package:medicalpasal/api/api.dart';

// class ApiProvider {
//   //get products data
//   Future getProductsData() async {
//     try {
//       var response = await Api().getData('products');
//       var products = json.decode(response.body)['data'];
//       print(products);
//       return products;
//     } on SocketException {
//       return null;
//     }
//   }
// }
