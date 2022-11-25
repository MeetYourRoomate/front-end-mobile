import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/roommate_coexistance/presentation/page/list_all_teams_page.dart';
import 'package:meet_your_roommate_app/roommate_coexistance/presentation/page/my_team_page.dart';
import 'package:meet_your_roommate_app/user_matching/application/team_service.dart';
import 'package:meet_your_roommate_app/user_matching/domain/entity/team.dart';

import '../../../common/utils/colors.dart';

class UserGroupPage extends StatefulWidget {
  const UserGroupPage({super.key});

  @override
  State<UserGroupPage> createState() => _UserGroupPageState();
}

class _UserGroupPageState extends State<UserGroupPage> {
  final TeamService teamService = locator<TeamService>();

  List<Team> teams = [];

  Future fetchData() async {
    if (FirebaseAuth.instance.currentUser != null) {
      final teamsData = await teamService.getAllTeams();

      if (mounted) {
        setState(() {
          teams = teamsData;
        });
      }
    }
  }

  @override
  void initState() {
    fetchData();
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
                    text: "MY TEAM",
                  ),
                  Tab(
                    text: "ALL TEAMS",
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  MyTeamPage(),
                  ListAllTeamsPage(
                    teams: teams,
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
