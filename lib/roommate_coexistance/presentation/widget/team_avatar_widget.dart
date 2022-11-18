import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';

class TeamAvatarWidget extends StatelessWidget {
  const TeamAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 110,
          width: 120,
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                  image:
                      AssetImage("lib/shared/assets/image/avatar_team.png"))),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsApp.primaryColor2,
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                )),
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
