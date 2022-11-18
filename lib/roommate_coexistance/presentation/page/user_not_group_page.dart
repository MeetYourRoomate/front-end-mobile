import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/roommate_coexistance/presentation/page/new_team_page.dart';

class UserNotGroupPage extends StatefulWidget {
  const UserNotGroupPage({super.key});

  @override
  State<UserNotGroupPage> createState() => _UserNotGroupPageState();
}

class _UserNotGroupPageState extends State<UserNotGroupPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            "lib/shared/assets/image/team.png",
            scale: 4,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Create groups and add friends",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Organize your team with ease. Assign tasks and monitor coexistence",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewTeamPage()));
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: ColorsApp.primaryColor2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Create new team",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
