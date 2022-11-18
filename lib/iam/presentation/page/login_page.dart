import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/iam/application/auth_service.dart';
import 'package:meet_your_roommate_app/iam/application/user_service.dart';
import 'package:meet_your_roommate_app/iam/domain/entity/user.dart';
import 'package:meet_your_roommate_app/iam/user_provider.dart';
import 'package:meet_your_roommate_app/profile/application/user_profile_service.dart';
import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const LoginPage({super.key, required this.showLoginPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late UserService userService;
  late AuthService authService;
  late UserProfileService userProfileService;

  @override
  void initState() {
    userService = UserService();
    authService = AuthService();
    userProfileService = UserProfileService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "http://contempo.com.pe/files/1/page-contents/shutterstock_568241401-1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            verticalDirection: VerticalDirection.up,
            children: [
              Container(),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "lib/shared/assets/icon/logo.png",
                            height: 80.0,
                          ),
                          const Text(
                            "Meet Your\nRoommate",
                            style: TextStyle(
                              color: Color(0xff66030E),
                              fontSize: 34.0,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextFormField(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextFormField(),
                        ],
                      ),
                    ),
                    const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    InkWell(
                      onTap: () async {},
                      child: Container(
                        height: 45.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff66030E),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Continue With",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    InkWell(
                      onTap: () async {
                        final navigator = Navigator.of(context);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: ColorsApp.primaryColor2,
                              ),
                            );
                          },
                        );
                        final user = await authService.signInWithGoogle();
                        if (user != null) {
                          UserAuth userAuth =
                              UserAuth(user.uid, user.email, null, null);
                          final saverUser =
                              await userService.saveUser(userAuth);
                          // ignore: avoid_print
                          print(saverUser);
                          UserProfile userProfile = UserProfile(
                            user.displayName,
                            user.photoURL,
                            "",
                            user.phoneNumber,
                            "",
                            "",
                            "",
                            null,
                          );
                          await userProfileService.saveUserProfile(
                              userProfile, user.uid);
                        }
                        userProvider.setIsLogged(isLogged: true);
                        navigator.pop();
                      },
                      child: Container(
                        height: 35.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Image.asset(
                            "lib/shared/assets/icon/google.png",
                            height: 25.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Don't Have account?",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          InkWell(
                            onTap: widget.showLoginPage,
                            child: const Text(
                              "Create an Account",
                              style: TextStyle(
                                color: Color(0xff66030E),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
