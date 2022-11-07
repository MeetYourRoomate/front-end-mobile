import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/admin_settings_page.dart';

class MainControllerPage extends StatefulWidget {
  const MainControllerPage({Key? key}) : super(key: key);

  @override
  State<MainControllerPage> createState() => _MainControllerPageState();
}

class _MainControllerPageState extends State<MainControllerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return const AdminSettingsPage();
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
