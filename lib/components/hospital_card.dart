import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final int numberOfItems;

  HospitalCard({this.categoryName, this.imagePath, this.numberOfItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Sisam'),
    );
  }
}
