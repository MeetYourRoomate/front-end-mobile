import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class UserMatchingWidget extends StatelessWidget {
  final List images;
  const UserMatchingWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: ((context, index, realIndex) {
        return Container(
            decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(
            color: Colors.orange,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(images[index]),
          ),
        ));
      }),
      options: CarouselOptions(
        height: 400,
        viewportFraction: 0.8,
        aspectRatio: 0.5,
      ),
    );
  }
}
