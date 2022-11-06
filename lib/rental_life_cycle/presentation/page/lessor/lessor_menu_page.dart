import 'package:flutter/material.dart';
import 'package:meet_your_roommate/iam/application/auth_service.dart';
import 'package:meet_your_roommate/iam/presentation/page/auth_page.dart';
import 'package:meet_your_roommate/iam/user_provider.dart';
import 'package:provider/provider.dart';

class LessorMenuPage extends StatefulWidget {
  const LessorMenuPage({super.key});

  @override
  State<LessorMenuPage> createState() => _LessorMenuPageState();
}

class _LessorMenuPageState extends State<LessorMenuPage> {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
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
                  const SizedBox(
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: () async {
                      userProvider.setUserStatus(userStatus: "user");
                    },
                    child: Container(
                      height: 70.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(25.0)),
                      child: const Center(child: Text("Cambiar a estudiante")),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const AuthPage();
  }
}
