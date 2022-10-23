import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate/iam/presentation/page/user_controller.dart';
import 'package:meet_your_roommate/rental_life_cycle/presentation/page/student/main_page.dart';

class AuthenticationController extends StatelessWidget {
  const AuthenticationController({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return const UserController();
          } else {
            return const MainPageStudent();
          }
        }),
      ),
    );
  }
}
