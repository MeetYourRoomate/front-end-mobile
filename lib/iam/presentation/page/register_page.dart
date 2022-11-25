import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';

import 'package:meet_your_roommate_app/iam/presentation/page/create_profile_page.dart';
import 'package:meet_your_roommate_app/iam/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future signUp() async {
    if (isValidEmail && validPassword()) {
      List a = await FirebaseAuth.instance
          .fetchSignInMethodsForEmail(_emailController.text.trim());
      if (a.isEmpty) {
        setState(() {
          errCorreo = "";
        });
      } else {
        setState(() {
          errCorreo = "Email already exists";
        });
      }
    } else {
      setState(() {
        errCorreo = "Password or Email Incorrect";
      });
    }
  }

  bool validPassword() {
    if (_passwordController.text.isNotEmpty &&
        _passwordController.text.trim() ==
            _confirmPasswordController.text.trim()) {
      return true;
    }
    return false;
  }

  void nextScreen() {
    if (errCorreo.isEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateProfilePage(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                  )));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool isValidEmail = false;

  String errCorreo = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
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
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
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
                          padding:
                              const EdgeInsets.only(top: 35.0, bottom: 20.0),
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
                        const Text(
                          "Account Iformation",
                          style: TextStyle(
                            color: Color(0xff66030E),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, bottom: 2.0),
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    errCorreo,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.0,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
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
                              const SizedBox(
                                height: 20.0,
                              ),
                              const Text(
                                "Confirm Password",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextFormField(
                                controller: _confirmPasswordController,
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
                        const SizedBox(
                          height: 10.0,
                        ),
                        InkWell(
                          onTap: () async {
                            await signUp();

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
                                "Register",
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
                          height: 15.0,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Have account?",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              InkWell(
                                onTap: widget.showLoginPage,
                                child: const Text(
                                  "Login",
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
