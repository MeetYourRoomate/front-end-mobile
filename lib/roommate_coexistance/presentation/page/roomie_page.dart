import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/iam/application/auth_service.dart';
import 'package:meet_your_roommate_app/iam/user_provider.dart';

import 'package:provider/provider.dart';

class RoomiePage extends StatefulWidget {
  const RoomiePage({super.key});

  @override
  State<RoomiePage> createState() => _RoomiePageState();
}

class _RoomiePageState extends State<RoomiePage> {
  late AuthService authService;

  @override
  void initState() {
    authService = AuthService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Center(
        child: Container(
          child: userProvider.isLogged
              ? const Text("Estamos Trabajando")
              : const Text("Inicia Sesion para ver"),
        ),
      ),
    );
  }
}
