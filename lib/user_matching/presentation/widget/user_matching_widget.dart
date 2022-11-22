import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';

class UserMatchingWidget extends StatelessWidget {
  final List<UserProfile> profiles;
  final List images;
  const UserMatchingWidget(
      {super.key, required this.images, required this.profiles});

  @override
  Widget build(BuildContext context) {
    String imagedefaul =
        "https://firebasestorage.googleapis.com/v0/b/meet-your-roommate-c7ed7.appspot.com/o/common%2Fwhatsapp-foto-perfil.jpg?alt=media&token=6971551c-7299-417c-915f-a8952a452712";

    return profiles.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CarouselSlider.builder(
                itemCount: profiles.length,
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
                            image: NetworkImage(
                                profiles[index].photoUrl!.isNotEmpty
                                    ? profiles[index].photoUrl!
                                    : imagedefaul),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${profiles[index].name}, ${profiles[index].age}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "${profiles[index].country}  -  ${profiles[index].city}",
                              style: TextStyle(
                                color: Colors.black,
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
          )
        : const Center(
            child: Text("no matches"),
          );
  }
}
