import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';
import 'package:meet_your_roommate_app/user_matching/application/roommate_request_service.dart';

class UserMatchingWidget extends StatefulWidget {
  final List<UserProfile> profiles;
  final List images;
  const UserMatchingWidget(
      {super.key, required this.images, required this.profiles});

  @override
  State<UserMatchingWidget> createState() => _UserMatchingWidgetState();
}

class _UserMatchingWidgetState extends State<UserMatchingWidget> {
  RoommateRequestService roommateRequestService =
      locator<RoommateRequestService>();
  int profileId = -1;

  @override
  Widget build(BuildContext context) {
    String imagedefaul =
        "https://firebasestorage.googleapis.com/v0/b/meet-your-roommate-c7ed7.appspot.com/o/common%2Fwhatsapp-foto-perfil.jpg?alt=media&token=6971551c-7299-417c-915f-a8952a452712";

    return widget.profiles.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CarouselSlider.builder(
                itemCount: widget.profiles.length,
                itemBuilder: ((context, index, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: ColorsApp.primaryColor2,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                widget.profiles[index].photoUrl!.isNotEmpty
                                    ? widget.profiles[index].photoUrl!
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
                              "${widget.profiles[index].name}, ${widget.profiles[index].age}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "${widget.profiles[index].country}  -  ${widget.profiles[index].city}",
                              style: const TextStyle(
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
                  onPageChanged: (index, reason) {
                    setState(() {
                      profileId = widget.profiles[index].id!;
                    });
                  },
                ),
              ),
              InkWell(
                onTap: () async {
                  final navigator = Navigator.of(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: ColorsApp.primaryColor2,
                        ),
                      );
                    },
                  );
                  if (FirebaseAuth.instance.currentUser != null) {
                    final data =
                        await roommateRequestService.createRoommateRequest(
                            FirebaseAuth.instance.currentUser!.uid, profileId);
                    print(data.status);
                  }
                  navigator.pop();
                },
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: ColorsApp.primeryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.favorite,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        : const Center(
            child: Text("no matches"),
          );
  }
}
