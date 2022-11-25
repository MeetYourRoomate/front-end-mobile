import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/profile/application/user_profile_service.dart';
import 'package:meet_your_roommate_app/profile/presentation/page/profile_page.dart';
import 'package:meet_your_roommate_app/profile/user_profile_provider.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/student/home_page.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/student/rented_property.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/property_request.dart';
import 'package:meet_your_roommate_app/roommate_coexistance/presentation/page/roomie_page.dart';
import 'package:meet_your_roommate_app/social_interaction/presentation/page/favorite_page.dart';
import 'package:meet_your_roommate_app/user_matching/team_provider.dart';
import 'package:provider/provider.dart';

class MainPageStudent extends StatefulWidget {
  const MainPageStudent({super.key});

  @override
  State<MainPageStudent> createState() => _MainPageStudentState();
}

class _MainPageStudentState extends State<MainPageStudent> {
  final UserProfileService userProfileService = locator<UserProfileService>();

  int _index = 0;
  final pages = [
    const HomePageStudent(),
    const FavoritePage(),
    const RentedPropertyPage(),
    const RoomiePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final requestProvider = Provider.of<PropertyRequestProvider>(context);
    final userProfileProvider = Provider.of<UserProfileProvider>(context);
    final teamProvider = Provider.of<TeamProvider>(context);
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorsApp.primeryColor,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            backgroundColor: ColorsApp.primeryColor,
            icon: const Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorsApp.primeryColor,
            icon: const Icon(Icons.favorite_border_outlined),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorsApp.primeryColor,
            icon: const Icon(Icons.key),
            label: "Rented",
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorsApp.primeryColor,
            icon: const Icon(Icons.people),
            label: "Roomie",
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorsApp.primeryColor,
            icon: const Icon(Icons.verified_user),
            label: "User",
          ),
        ],
        onTap: ((value) async {
          switch (value) {
            case 2:
              if (FirebaseAuth.instance.currentUser != null) {
                await requestProvider
                    .setRequestStudent(FirebaseAuth.instance.currentUser!.uid);
              }
              break;
            case 3:
              if (FirebaseAuth.instance.currentUser != null) {
                await userProfileProvider
                    .setListProfiles(FirebaseAuth.instance.currentUser!.uid);
                await teamProvider
                    .setTeam(FirebaseAuth.instance.currentUser!.uid);
              }
              break;
            case 4:
              if (userProfileProvider.id == -1 &&
                  FirebaseAuth.instance.currentUser != null) {
                userProfileProvider.setUserProfileProvider(
                    FirebaseAuth.instance.currentUser!.uid);
              }
              break;
          }
          setState(() {
            _index = value;
          });
        }),
      ),
    );
  }
}
