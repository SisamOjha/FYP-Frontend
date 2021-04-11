

import 'package:DoctorOnHand/components/buttonWidget.dart';
import 'package:DoctorOnHand/screens/hospitals/hospitaldetails/hospitalDetailImage.dart';


import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'hospitalDetailBody.dart';


class HospitalDetailScreen extends StatefulWidget {
  const HospitalDetailScreen({Key key, this.mydata}) : super(key: key);

  final mydata;

  @override
  _HospitalDetailScreenState createState() => _HospitalDetailScreenState();
}

class _HospitalDetailScreenState extends State<HospitalDetailScreen> {
  int selectedImage = 0;
  int numOfItems = 1;
  var newList;
  var list1;
  var list2;
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    buildSmallHospitalPreview(context);
  }

  Widget buildSmallHospitalPreview(BuildContext context) {
    if (widget.mydata["detailImages"].length == 0) {
      list1 = [widget.mydata["featureImage"]];
      newList = list1;
    } else {
      list1 = [widget.mydata["featureImage"]];
      list2 = [
        'http://192.168.100.210:8000/api/' + "profileImage" + widget.mydata["detailImages"][0]["name"]
      ];
      newList = list1 + list2;
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(newList.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImage = index;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  margin: EdgeInsets.only(right: 15),
                  padding: EdgeInsets.all(8),
                  height: getProportionateScreenWidth(48),
                  width: getProportionateScreenWidth(48),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: kPrimaryColor
                            .withOpacity(selectedImage == index ? 1 : 0)),
                  ),
                  child: Image.network(newList[index]),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
           HospitalDetailImage(
              tag: widget.mydata["id"].toString(),
              image: newList[selectedImage],
            ),
            SizedBox(height: getProportionateScreenWidth(15)),
            buildSmallHospitalPreview(context),
             HospitalDetailBody(
              mydata: widget.mydata,
            ),
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: ButtonWidget(
                buttonColor: kPrimaryColor,
                textColor: Colors.white,
                borderColor: kPrimaryColor,
                borderRadius: 7.0,
                onPressed: () {},
                buttonName: "Buy Now"),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: ButtonWidget(
                buttonColor: kPrimaryColor,
                textColor: Colors.white,
                borderColor: kPrimaryColor,
                borderRadius: 10.0,
                onPressed: () {
                  cartBottomSheet(context);
                },
                buttonName: "Add to Fav"),
          ),
        ],
      ),
    );
  }

  // Edit Modal
  void cartBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height * .60,
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter stateSetter) {
              return Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                              height: 40,
                              width: 40,
                              child: Image.network(
                                newList[selectedImage],
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.mydata["name"],
                                style: TextStyle(
                                    fontSize: 18, color: Colors.green[900]),
                              ),
                             
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.orange,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                        height: 32,
                        child: buildOutlineButton(
                            press: () {
                              if (numOfItems > 1) {
                                stateSetter(() {
                                  numOfItems--;
                                });
                              }
                            },
                            icon: Icons.remove),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          // if our item is less  then 10 then  it shows 01 02 like that
                          numOfItems.toString().padLeft(2, "0"),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      
                    ],
                  ),
                  
                ],
              );
            }),
          ),
        );
      },
    );
  }

  OutlineButton buildOutlineButton({Function press, IconData icon}) {
    return OutlineButton(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      onPressed: press,
      child: Icon(icon),
    );
  }
}
