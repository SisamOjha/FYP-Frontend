import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';



class HospitalDetailBody extends StatelessWidget {
  final mydata;

  const HospitalDetailBody({Key key, this.mydata}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            "Hospital Title",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        // InkWell(
        //   onTap: () {
        //     Provider.of<HospitalData>(context)
        //             .cartItems
        //             .contains(widget.mydata["id"])
        //         ? Provider.of<HospitalData>(context)
        //             .removeCart(widget.mydata["id"])
        //         : Provider.of<HospitalData>(context)
        //             .addCart(widget.mydata["id"]);
        //   },
        //   child: Align(
        //     alignment: Alignment.centerRight,
        //     child: Container(
        //       padding:
        //           EdgeInsets.all(getProportionateScreenWidth(15)),
        //       width: getProportionateScreenWidth(64),
        //       decoration: BoxDecoration(
        //         color: Provider.of<HospitalData>(context)
        //                 .cartItems
        //                 .contains(widget.mydata["id"])
        //             ? Color(0xFFFFE6E6)
        //             : Color(0xFFF5F6F9),
        //         borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(20),
        //           bottomLeft: Radius.circular(20),
        //         ),
        //       ),
        //       child: SvgPicture.asset(
        //         "assets/images/Heart Icon_2.svg",
        //         color: Provider.of<HospitalData>(context)
        //                 .cartItems
        //                 .contains(widget.mydata["id"])
        //             ? Color(0xFFFF4848)
        //             : Color(0xFFDBDEE4),
        //         height: getProportionateScreenWidth(16),
        //       ),
        //     ),
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            "Description",
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  "See More Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        ),

        Text(
          mydata["name"],
        )
      ],
    );
  }
}
