import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/iam/application/auth_service.dart';
import 'package:meet_your_roommate_app/iam/application/user_service.dart';
import 'package:meet_your_roommate_app/iam/domain/entity/user.dart';
import 'package:meet_your_roommate_app/iam/presentation/page/authentication_controller.dart';
import 'package:meet_your_roommate_app/iam/user_provider.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/profile/application/user_profile_service.dart';
import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';

import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const LoginPage({super.key, required this.showLoginPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late AuthService authService;
  final UserService userService = locator<UserService>();

  final UserProfileService userProfileService = locator<UserProfileService>();

  Future signIn() async {
    List a = await FirebaseAuth.instance
        .fetchSignInMethodsForEmail(_emailController.text.trim());
    if (a.isEmpty) {
      setState(() {
        error = "Email or Password invalid";
      });
    } else {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    }
  }

  @override
  void initState() {
    authService = AuthService();
    super.initState();
  }

  void nextScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const AuthenticationController()));
  }

  String error = "";

  bool isValidEmail = false;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
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
                          TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black38,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  isValidEmail = isEmail(value);
                                });
                              }),
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
                          TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.black38,
                              ),
                            ),
                          ),
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
                        await signIn();
                        navigator.pop();
                        userProvider.setIsLogged(isLogged: true);
                        nextScreen();
                      },
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
                          await userService.saveUser(
                              UserAuth(user.uid, user.email, null, null));
                          await userProfileService.saveUserProfile(
                              UserProfile(
                                null,
                                user.displayName,
                                "xxxxxx",
                                user.photoURL,
                                "xxxxx",
                                "",
                                "",
                                "xxxxxx",
                                "xxxxxx",
                                0,
                                "xxxxxxxxx",
                                "+51",
                              ),
                              user.uid);
                        }
                        await userProvider.setIsLogged(isLogged: true);
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
