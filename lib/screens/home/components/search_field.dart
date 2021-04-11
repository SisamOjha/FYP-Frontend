import 'package:flutter/material.dart';
import 'package:DoctorOnHand/models/searchModel.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            // onPressed:(){
              
            // },
            hintText: "Search",
            prefixIcon: IconButton(
              icon: Icon(Icons.search),
             onPressed: () {
                showSearch(context: context, delegate: SearchModel());}, )
         
      ),
    )
    );
  }
}
