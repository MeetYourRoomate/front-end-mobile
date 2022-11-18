import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/lessor/list_lessor_message_page.dart';

class LessorMessagePage extends StatefulWidget {
  const LessorMessagePage({super.key});

  @override
  State<LessorMessagePage> createState() => _LessorMessagePageState();
}

class _LessorMessagePageState extends State<LessorMessagePage> {
  bool message = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                splashBorderRadius: BorderRadius.circular(25),
                indicatorColor: ColorsApp.primaryColor2,
                labelColor: ColorsApp.primaryColor2,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: "All",
                  ),
                  Tab(
                    text: "Pending",
                  ),
                  Tab(
                    text: "Accepted",
                  ),
                  Tab(
                    text: "Rejected",
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  const ListLessorMessagePage(
                    isPending: false,
                  ),
                  const ListLessorMessagePage(
                    isPending: true,
                  ),
                  Container(),
                  Container(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
