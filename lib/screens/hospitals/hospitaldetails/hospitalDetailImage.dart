import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';

class HospitalDetailImage extends StatelessWidget {
  final String tag;
  final String image;

  const HospitalDetailImage({Key key, this.tag, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 1,
        child: Hero(
          tag: tag,
          child: ClipRect(
            child: PhotoView(
              maxScale: MediaQuery.of(context).size.height / 2,
              imageProvider: NetworkImage(
                image,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
