import 'package:flutter/material.dart';
import 'package:meet_your_roommate/iam/user_provider.dart';
import 'package:meet_your_roommate/rental_life_cycle/presentation/page/lessor/lessor_main_page.dart';
import 'package:meet_your_roommate/rental_life_cycle/presentation/page/student/main_page.dart';
import 'package:provider/provider.dart';

class UserController extends StatefulWidget {
  const UserController({super.key});

  @override
  State<UserController> createState() => _UserControllerState();
}

class _UserControllerState extends State<UserController> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (userProvider.userStatus == "user") {
            return const MainPageStudent();
          } else {
            return const LessorMainPage();
          }
        },
      ),
    );
  }
}
