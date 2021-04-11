import 'package:flutter/material.dart';


class HospitalDetailImage extends StatelessWidget {
  final String tag;
  final String image;

  const HospitalDetailImage({Key key, this.tag, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 1,
        child: Hero(
          tag: tag,
          child: Image.network(
                image,
              ),
            ),
          ),
        );

  }
}
