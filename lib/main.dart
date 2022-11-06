import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate/common/pages/student/main_page.dart';
import 'package:meet_your_roommate/iam/presentation/page/authentication_controller.dart';
import 'package:meet_your_roommate/iam/user_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: const AuthenticationController(),
      ),
    );
  }
}
