import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/pages/lessor/lessor_main_page.dart';
import 'package:meet_your_roommate_app/common/pages/student/main_page.dart';
import 'package:meet_your_roommate_app/fast_test.dart';
import 'package:meet_your_roommate_app/iam/presentation/page/auth_page.dart';
import 'package:meet_your_roommate_app/iam/presentation/page/authentication_controller.dart';
import 'package:meet_your_roommate_app/iam/presentation/page/register_page.dart';
import 'package:meet_your_roommate_app/iam/user_provider.dart';
import 'package:meet_your_roommate_app/iam/presentation/page/create_profile_page.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/profile/user_profile_provider.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/property_provider.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/property_request.dart';
import 'package:meet_your_roommate_app/roommate_coexistance/presentation/page/user_group_page.dart';
import 'package:meet_your_roommate_app/user_matching/team_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initIjectable();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    bool isLogged = false;
    if (user != null) {
      isLogged = true;
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(isLogged),
        ),
        ChangeNotifierProvider(create: ((context) => PropertyProvider())),
        ChangeNotifierProvider(create: (context) => UserProfileProvider()),
        ChangeNotifierProvider(create: (context) => PropertyRequestProvider()),
        ChangeNotifierProvider(create: (context) => TeamProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthenticationController(),
      ),
    );
  }
}
