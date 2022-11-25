import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/profile/user_profile_provider.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/lessor/lessor_admin_page.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/lessor/lessor_home_page.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/lessor/lessor_menu_page.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/lessor/lessor_message_page.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/property_request.dart';
import 'package:provider/provider.dart';

class LessorMainPage extends StatefulWidget {
  const LessorMainPage({super.key});

  @override
  State<LessorMainPage> createState() => _LessorMainPageState();
}

class _LessorMainPageState extends State<LessorMainPage> {
  int _index = 0;
  final pages = [
    const LessorHomePage(),
    const LessorMessagePage(),
    const LessorAdminApge(),
    const LessorMenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final requestProvider = Provider.of<PropertyRequestProvider>(context);
    final userProfileProvider = Provider.of<UserProfileProvider>(context);

    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            backgroundColor: ColorsApp.primaryColor2,
            icon: const Icon(Icons.home),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorsApp.primaryColor2,
            icon: const Icon(Icons.message),
            label: "MESSAGE",
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorsApp.primaryColor2,
            icon: const Icon(
              Icons.admin_panel_settings,
            ),
            label: "ADMIN",
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorsApp.primaryColor2,
            icon: const Icon(Icons.menu),
            label: "MENU",
          ),
        ],
        onTap: (value) async {
          switch (value) {
            case 0:
              if (userProfileProvider.id == -1) {
                userProfileProvider.setUserProfileProvider(
                    FirebaseAuth.instance.currentUser!.uid);
              }
              break;
            case 1:
              if (FirebaseAuth.instance.currentUser != null) {
                await requestProvider
                    .setRequestLessor(FirebaseAuth.instance.currentUser!.uid);
              }

              break;
          }

          setState(() {
            _index = value;
          });
        },
      ),
    );
  }
}
