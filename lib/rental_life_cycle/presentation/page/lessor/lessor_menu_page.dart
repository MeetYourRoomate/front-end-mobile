import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/iam/application/auth_service.dart';
import 'package:meet_your_roommate_app/iam/application/user_service.dart';
import 'package:meet_your_roommate_app/iam/domain/entity/user.dart';
import 'package:meet_your_roommate_app/iam/user_provider.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/profile/presentation/page/personal_info_page.dart';
import 'package:meet_your_roommate_app/profile/presentation/widget/circle_avatar_profile_widget.dart';
import 'package:meet_your_roommate_app/profile/user_profile_provider.dart';

import 'package:provider/provider.dart';

import '../../../../iam/presentation/page/auth_page.dart';

class LessorMenuPage extends StatefulWidget {
  const LessorMenuPage({super.key});

  @override
  State<LessorMenuPage> createState() => _LessorMenuPageState();
}

class _LessorMenuPageState extends State<LessorMenuPage> {
  final UserService userService = locator<UserService>();
  late AuthService authService;

  @override
  void initState() {
    authService = AuthService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userProfileProvider = Provider.of<UserProfileProvider>(context);
    return userProvider.isLogged
        ? Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleProfileAvatar(
                          image: userProfileProvider.photoUrl,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          userProfileProvider.name,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const InkWell(
                          child: Text(
                            "Show Profile",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              decorationThickness: 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PersonalInfoPage()));
                        },
                        title: const Text(
                          "Personal info",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                              "lib/shared/assets/icon/perfil-del-usuario.png"),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {},
                        title: const Text(
                          "Account",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child:
                              Image.asset("lib/shared/assets/icon/setting.png"),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 10,
                          bottom: 15,
                        ),
                        child: Text(
                          "Hosting",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () async {
                          userProvider.setUserStatus(
                              userStatus: "ROLE_USER_STUDENT");
                        },
                        title: const Text(
                          "Change to student",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                              "lib/shared/assets/icon/perfil-del-usuario.png"),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 10,
                          bottom: 15,
                        ),
                        child: Text(
                          "Support",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: const Text(
                          "How meet your roomate works",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.asset("lib/shared/assets/icon/logo.png"),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {},
                        title: const Text(
                          "Get help",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.asset("lib/shared/assets/icon/help.png"),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {},
                        title: const Text(
                          "Contact customer service",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child:
                              Image.asset("lib/shared/assets/icon/support.png"),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.transparent,
                          child:
                              Image.asset("lib/shared/assets/icon/globe.png"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("English (US)"),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text("S/. PEN"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
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
                        userProfileProvider.clear();
                        navigator.pop();
                      },
                      child: Container(
                        height: 60.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            )),
                        child: const Center(
                            child: Text(
                          "Log Out",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Terms of Service",
                            style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Privacy Policy",
                            style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "© 2022 UPC S.A.C. All rights reserved",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          )
        : const AuthPage();
  }
}
