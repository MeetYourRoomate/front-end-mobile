import 'package:flutter/material.dart';

class CircleProfileAvatar extends StatelessWidget {
  final String image;
  final double radius;
  const CircleProfileAvatar({super.key, required this.image, this.radius = 50});

  @override
  Widget build(BuildContext context) {
    bool verified = (image != "") ? true : false;
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.black12,
      backgroundImage: verified
          ? NetworkImage(image)
          : const NetworkImage(
              "https://firebasestorage.googleapis.com/v0/b/meet-your-roommate-c7ed7.appspot.com/o/common%2Fuser.png?alt=media&token=f39a2c1d-8321-4b2d-87fc-d3b64c4b2618",
            ),
    );
  }
}
