import 'package:flutter/material.dart';

class CircleProfileAvatar extends StatelessWidget {
  final String image;
  const CircleProfileAvatar({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.black12,
      backgroundImage: NetworkImage(
        image,
      ),
    );
  }
}
