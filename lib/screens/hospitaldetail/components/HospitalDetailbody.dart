

import 'package:DoctorOnHand/size_config.dart';
import 'package:flutter/material.dart';


class HospitalDetailBody extends StatelessWidget {
  final mydata;

  const HospitalDetailBody({Key key, this.mydata}) : super(key: key);

  // Future getFavourite() async {
  //   try {
  //     var response = await Api().getData('favourite');
  //     var products = json.decode(response.body)['data'];
  //     print("===========");

  //     print(products);
  //   } on SocketException {
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon(Icons.favorite, color:  ,),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              child: Text(
                mydata['name'] +', '+ mydata['zone']+', '+ mydata['country'] .toString(),
                style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,  color: Colors.lightBlue.shade900),

              ),
            ),
            
            
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //      horizontal: getProportionateScreenWidth(10)),
            //   child: IconButton(
            //     icon: Icon(
            //       Icons.favorite,
            //       color: Color(0xFFB71C1C),
            //     ),
            //     onPressed: () async {
            //       Map data = {
            //         'hospital_id': mydata['id'],
            //       };
            //       var response = await Api().postData(data, 'wishlist');
            //       print(response.statusCode);
            //     },
            //   ),
            // ),
            
          ],
        ),

         SizedBox(height: 15),
          Padding(
          padding:
              EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
          child: Text(
            'Address'+ ': '+'' + mydata['city']+'-'+ mydata['ward'] +', '+ mydata['district'].toString(),
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.lightBlue.shade900),
          ),
        ),
         SizedBox(height: 15),   
       Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Text(
            'Description',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.blue.shade900,),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Text(
            'Hospital is a kind of institution which deals with health care activities. It is an institution that provides treatment to patients. The name of this hospital is '+ mydata["name"]+' .It is located at '+mydata["district"]+' district of '+ mydata["country"] + mydata['description'] + 'You can contact us at '+ mydata["telephone"].toString(),
            style: TextStyle(fontSize: 15),
          ),
        ),
        
        SizedBox(
          height: 15,
        ),
        
        SizedBox(height: 15),
        SizedBox(height: 15),  
        
      ],
    );
  }
}