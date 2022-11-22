import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/pages/student/main_page.dart';
import 'package:meet_your_roommate_app/iam/presentation/page/user_controller.dart';
import 'package:meet_your_roommate_app/profile/user_profile_provider.dart';
import 'package:provider/provider.dart';

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
