import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/roommate_coexistance/presentation/widget/team_avatar_widget.dart';

class NewTeamPage extends StatefulWidget {
  const NewTeamPage({super.key});

  @override
  State<NewTeamPage> createState() => _NewTeamPageState();
}

class _NewTeamPageState extends State<NewTeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor2,
        title: const Text("New Team"),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const Center(
                child: TeamAvatarWidget(),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                cursorColor: ColorsApp.primaryColor2,
                decoration: InputDecoration(
                  iconColor: ColorsApp.primaryColor2,
                  focusColor: ColorsApp.primaryColor2,
                  fillColor: ColorsApp.primaryColor2,
                  hoverColor: ColorsApp.primaryColor2,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: ColorsApp.primaryColor2,
                    width: 2,
                  )),
                ),
                initialValue: "Name of team",
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  cursorColor: ColorsApp.primaryColor2,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.primaryColor2,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(
          Icons.check,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
