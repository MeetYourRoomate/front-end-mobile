import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/auth_with_google.dart';

class AdminSettingsPage extends StatefulWidget {
  const AdminSettingsPage({Key? key}) : super(key: key);

  @override
  State<AdminSettingsPage> createState() => _AdminSettingsPageState();
}

class _AdminSettingsPageState extends State<AdminSettingsPage> {
  final GoogleAuthService _authService = GoogleAuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  await _authService.signOutGoogle();
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 50.0, top: 150.0),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.center,
                    width: 250.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF82D00),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Text(
                      "SALIR",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
