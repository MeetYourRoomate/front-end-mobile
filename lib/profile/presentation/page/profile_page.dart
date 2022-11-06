import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate/iam/application/auth_service.dart';
import 'package:meet_your_roommate/iam/application/user_service.dart';
import 'package:meet_your_roommate/iam/domain/entity/user.dart';
import 'package:meet_your_roommate/iam/presentation/page/auth_page.dart';
import 'package:meet_your_roommate/iam/user_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserService userService;
  late AuthService authService;

  @override
  void initState() {
    userService = UserService();
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
                      String? uid = FirebaseAuth.instance.currentUser?.uid;
                      if (uid != null) {
                        UserAuth userAuth = await userService.updateUser(uid);
                        print(userAuth.role);
                      }
                      userProvider.setUserStatus(userStatus: "lessor");
                    },
                    child: Container(
                      height: 70.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(25.0)),
                      child: const Center(child: Text("Cambiar a arrendador")),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const AuthPage();
  }
}
