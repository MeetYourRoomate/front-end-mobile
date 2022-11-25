import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/user_matching/application/roommate_request_service.dart';
import 'package:meet_your_roommate_app/user_matching/domain/entity/roomate_request.dart';
import 'package:meet_your_roommate_app/user_matching/presentation/widget/roommie_request_widget.dart';

class RoommieMatchesPage extends StatefulWidget {
  const RoommieMatchesPage({super.key});

  @override
  State<RoommieMatchesPage> createState() => _RoommieMatchesPageState();
}

class _RoommieMatchesPageState extends State<RoommieMatchesPage> {
  RoommateRequestService roommateRequestService =
      locator<RoommateRequestService>();

  List<RoommateRequest> listRequestors = [];
  List<RoommateRequest> listRequested = [];

  Future fetchRoomateRequest() async {
    if (FirebaseAuth.instance.currentUser != null) {
      final requestors = await roommateRequestService
          .getAllRequestToUser(FirebaseAuth.instance.currentUser!.uid);
      final requested = await roommateRequestService
          .getAllRequestMadeByUser(FirebaseAuth.instance.currentUser!.uid);

      if (mounted) {
        setState(() {
          listRequestors = requestors;
          listRequested = requested;
        });
      }
    }
  }

  @override
  void initState() {
    fetchRoomateRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                    text: "Sent",
                  ),
                  Tab(
                    text: "Received",
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  RoommieRequestWidget(
                    isSent: true,
                    listRequest: listRequested,
                  ),
                  RoommieRequestWidget(
                    isSent: false,
                    listRequest: listRequestors,
                  ),
                ],
              ))
            ],
          )),
        ));
  }
}
