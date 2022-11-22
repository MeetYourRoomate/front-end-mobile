import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/iam/application/user_service.dart';
import 'package:meet_your_roommate_app/iam/domain/entity/country.dart';
import 'package:meet_your_roommate_app/iam/domain/entity/user.dart';
import 'package:meet_your_roommate_app/iam/presentation/page/authentication_controller.dart';
import 'package:meet_your_roommate_app/iam/user_provider.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/profile/application/user_profile_service.dart';
import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';
import 'package:meet_your_roommate_app/profile/presentation/widget/circle_avatar_profile_widget.dart';
import 'package:provider/provider.dart';

class CreateProfilePage extends StatefulWidget {
  final String email;
  final String password;
  const CreateProfilePage(
      {super.key, required this.email, required this.password});

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final listGender = ["man", "Woman"];
  List<Country> listCountry = [
    Country("lib/shared/assets/icon/chile.png", "chile", "+56"),
    Country("lib/shared/assets/icon/peru.png", "peru", "+51"),
    Country("lib/shared/assets/icon/espana.png", "espana", "+34"),
    Country("lib/shared/assets/icon/francia.png", "francia", "+33"),
  ];
  String gender = "Gender";
  String url = "lib/shared/assets/icon/peru.png";
  String code = "+51";

  final _numberController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _ageController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameControler = TextEditingController();
  final _aboutController = TextEditingController();

  String name = "";
  String surname = "";
  String about = "";
  String country = "";
  String city = "";
  String age = "";
  String number = "";

  final UserProfileService _userProfileService = locator<UserProfileService>();
  final UserService userService = locator<UserService>();

  Future signUp() async {
    print("Creando cuenta");
    final data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email, password: widget.password);

    if (data.user!.email != null) {
      await userService
          .saveUser(UserAuth(data.user!.uid, widget.email, null, null));
      await _userProfileService.saveUserProfile(
          UserProfile(
            null,
            name,
            surname,
            "",
            gender,
            about,
            "",
            country,
            city,
            int.parse(age),
            number,
            code,
          ),
          FirebaseAuth.instance.currentUser!.uid);
      print("Creando perfil");
    } else {
      setState(() {
        error = "no se que paso";
      });
    }
  }

  void nextScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const AuthenticationController()));
  }

  @override
  void dispose() {
    _numberController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _ageController.dispose();
    _nameController.dispose();
    _surnameControler.dispose();
    _aboutController.dispose();
    super.dispose();
  }

  String error = "";

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Center(
                  child: CircleProfileAvatar(image: ""),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton(
                      items: listCountry.map((Country a) {
                        return DropdownMenuItem(
                          value: a,
                          child: Row(
                            children: [
                              Image.asset(
                                a.urlImage!,
                                width: 25,
                                height: 25,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(a.code!)
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          url = value!.urlImage!;
                          code = value.code!;
                        });
                      },
                      hint: Row(
                        children: [
                          Image.asset(
                            url,
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(code)
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: TextFormField(
                          controller: _numberController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            setState(() {
                              number = value;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Country"),
                            TextFormField(
                              controller: _countryController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  country = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("City"),
                            TextFormField(
                              controller: _cityController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  city = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("age"),
                            TextFormField(
                              controller: _ageController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                age = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    DropdownButton(
                      items: listGender.map((String a) {
                        return DropdownMenuItem(
                          value: a,
                          child: Text(a),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                      hint: Text(gender),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Name"),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Surname"),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            surname = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("About"),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            about = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Center(child: Text(error)),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
        height: 70,
        child: InkWell(
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
            await signUp();
            userProvider.setIsLogged(isLogged: true);
            navigator.pop();
            nextScreen();
          },
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: ColorsApp.primaryColor2,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                "Save",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
