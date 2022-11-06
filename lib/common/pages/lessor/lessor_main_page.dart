import 'package:flutter/material.dart';
import 'package:meet_your_roommate/rental_life_cycle/presentation/page/lessor/lessor_admin_page.dart';
import 'package:meet_your_roommate/rental_life_cycle/presentation/page/lessor/lessor_home_page.dart';
import 'package:meet_your_roommate/rental_life_cycle/presentation/page/lessor/lessor_menu_page.dart';
import 'package:meet_your_roommate/rental_life_cycle/presentation/page/lessor/lessor_message_page.dart';

class LessorMainPage extends StatefulWidget {
  const LessorMainPage({super.key});

  @override
  State<LessorMainPage> createState() => _LessorMainPageState();
}

class _LessorMainPageState extends State<LessorMainPage> {
  int _index = 0;
  final pages = [
    const LessorHomePage(),
    const LessorMessagePage(),
    const LessorAdminApge(),
    const LessorMenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(Icons.message),
            label: "message",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(
              Icons.admin_panel_settings,
            ),
            label: "admin",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(Icons.menu),
            label: "menu",
          ),
        ],
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
      ),
    );
  }
}
