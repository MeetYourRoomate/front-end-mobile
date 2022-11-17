import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/iam/user_provider.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/student/rented_page.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/student/requests_page.dart';
import 'package:provider/provider.dart';

class RentedPropertyPage extends StatefulWidget {
  const RentedPropertyPage({super.key});

  @override
  State<RentedPropertyPage> createState() => _RentedPropertyPageState();
}

class _RentedPropertyPageState extends State<RentedPropertyPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return userProvider.isLogged
        ? DefaultTabController(
            length: 2,
            child: Scaffold(
              body: SafeArea(
                  child: Column(
                children: [
                  TabBar(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    splashBorderRadius: BorderRadius.circular(25),
                    indicatorColor: ColorsApp.primaryColor2,
                    labelColor: ColorsApp.primaryColor2,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        text: "Rented",
                      ),
                      Tab(
                        text: "Messages",
                      ),
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        RentedPage(),
                        RequestsPage(),
                      ],
                    ),
                  )
                ],
              )),
            ),
          )
        : const Scaffold(
            body: Center(
              child: Text("Inicia Sesion para ver"),
            ),
          );
  }
}
