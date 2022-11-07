import 'package:flutter/material.dart';

import 'package:meet_your_roommate_app/iam/presentation/page/login_page.dart';
import 'package:meet_your_roommate_app/iam/presentation/page/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = false;

  void toogScrens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        showLoginPage: toogScrens,
      );
    } else {
      return RegisterPage(
        showLoginPage: toogScrens,
      );
    }
  }
}
