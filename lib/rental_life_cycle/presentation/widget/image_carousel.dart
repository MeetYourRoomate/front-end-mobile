import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarouselWidget extends StatelessWidget {
  final List images;
  const ImageCarouselWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (((context, index, realIndex) {
        return Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(images[index]),
          ),
        ));
      })),
      options: CarouselOptions(
          viewportFraction: 1,
          height: 300,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 1000)),
    );
  }
}
