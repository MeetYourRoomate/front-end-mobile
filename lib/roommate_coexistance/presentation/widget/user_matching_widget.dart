import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class UserMatchingWidget extends StatelessWidget {
  final List images;
  const UserMatchingWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: ((context, index, realIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.orange,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(images[index]),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "Juan, 30",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Lima - Peru",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: const Icon(Icons.music_note),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: const Icon(Icons.coffee),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: const Icon(Icons.pedal_bike),
                      ),
                    ],
                  ),
                )
              ]),
            );
          }),
          options: CarouselOptions(
            height: 420,
            viewportFraction: 0.8,
            autoPlayCurve: Curves.easeInOut,
            aspectRatio: 0.5,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.red.shade400,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Image.asset("lib/shared/assets/icon/matching.png"),
            ),
            const SizedBox(
              width: 30,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.favorite,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
