import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/lessor/list_lessor_message_page.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/property_request.dart';
import 'package:provider/provider.dart';

class LessorMessagePage extends StatefulWidget {
  const LessorMessagePage({super.key});

  @override
  State<LessorMessagePage> createState() => _LessorMessagePageState();
}

class _LessorMessagePageState extends State<LessorMessagePage> {
  bool message = true;

  @override
  Widget build(BuildContext context) {
    final requestProvider = Provider.of<PropertyRequestProvider>(context);
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
                  requestProvider.listRequestLessor.isNotEmpty
                      ? ListLessorMessagePage(
                          isPending: false,
                          listRental: requestProvider.listRequestLessor,
                        )
                      : const Center(
                          child: Text("you have messages"),
                        ),
                  requestProvider.listPending.isNotEmpty
                      ? ListLessorMessagePage(
                          isPending: true,
                          listRental: requestProvider.listPending)
                      : const Center(
                          child: Text("you haven't pending messages"),
                        ),
                  requestProvider.listAcepted.isNotEmpty
                      ? ListLessorMessagePage(
                          isPending: false,
                          listRental: requestProvider.listAcepted)
                      : const Center(
                          child: Text("you haven't accepted  messages"),
                        ),
                  requestProvider.listDecline.isNotEmpty
                      ? ListLessorMessagePage(
                          isPending: false,
                          listRental: requestProvider.listDecline)
                      : const Center(
                          child: Text("you haven't rejected  messages"),
                        ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
