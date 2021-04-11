import 'package:flutter/material.dart';


class DoctorDetailImage extends StatelessWidget {
  final String tag;
  final String image;

  const DoctorDetailImage({Key key, this.tag, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 180, bottom: 0),
      child: SizedBox(
        
        height: 150.0,
        width: 600,
        child: AspectRatio(
          aspectRatio: 1,
          child: Hero(
            tag: tag,
            child: ClipRect(
              child: CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(image),
                

                // maxScale: MediaQuery.of(context).size.height / 2,
                // imageProvider: NetworkImage(
                //   image,
                ),
                
              ),
            ),
          ),
          
          
        
      ),
    );
  }
}