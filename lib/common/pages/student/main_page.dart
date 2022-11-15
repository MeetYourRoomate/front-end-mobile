import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/profile/application/user_profile_service.dart';
import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';
import 'package:meet_your_roommate_app/profile/presentation/page/profile_page.dart';
import 'package:meet_your_roommate_app/profile/user_profile_provider.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/student/home_page.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/student/rented_property.dart';
import 'package:meet_your_roommate_app/roommate_coexistance/presentation/page/roomie_page.dart';
import 'package:meet_your_roommate_app/social_interaction/presentation/page/favorite_page.dart';
import 'package:provider/provider.dart';

class MainPageStudent extends StatefulWidget {
  const MainPageStudent({super.key});

  @override
  State<MainPageStudent> createState() => _MainPageStudentState();
}

class _MainPageStudentState extends State<MainPageStudent> {
  late UserProfileService userProfileService;
  int _index = 0;
  final pages = [
    const HomePageStudent(),
    const FavoritePage(),
    const RentedPropertyPage(),
    const RoomiePage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    userProfileService = UserProfileService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProfileProvider = Provider.of<UserProfileProvider>(context);
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.search),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.favorite_border_outlined),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.key),
            label: "Rented",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.people),
            label: "roomie",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.verified_user),
            label: "user",
          ),
        ],
        onTap: ((value) async {
          switch (value) {
            case 4:
              if (userProfileProvider.id == -1) {
                UserProfile userProfile =
                    await userProfileService.getUserProfileByUserId(
                        FirebaseAuth.instance.currentUser!.uid);
                userProfileProvider.setUserProfileProvider(userProfile);
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
