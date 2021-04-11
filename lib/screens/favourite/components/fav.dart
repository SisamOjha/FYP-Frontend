import 'package:flutter/material.dart';


class Favourite extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
       
      ),
    );
  }
}
