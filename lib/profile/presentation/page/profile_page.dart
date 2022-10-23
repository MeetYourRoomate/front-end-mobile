import 'package:flutter/material.dart';
import 'package:meet_your_roommate/iam/application/auth_service.dart';
import 'package:meet_your_roommate/iam/presentation/page/auth_page.dart';
import 'package:meet_your_roommate/iam/user_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late AuthService authService;

  @override
  void initState() {
    authService = AuthService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return userProvider.isLogged
        ? Scaffold(
            body: Center(
              child: InkWell(
                onTap: () async {
                  final navigator = Navigator.of(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                  await authService.signOut();
                  userProvider.setIsLogged(isLogged: false);
                  navigator.pop();
                },
                child: Container(
                  height: 50.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25.0)),
                  child: const Center(child: Text("Salir")),
                ),
              ),
            ),
          )
        : const AuthPage();
  }
}
