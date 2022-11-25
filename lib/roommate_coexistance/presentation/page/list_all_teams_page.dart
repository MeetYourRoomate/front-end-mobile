import 'package:flutter/material.dart';

import 'package:meet_your_roommate_app/profile/presentation/widget/circle_avatar_profile_widget.dart';
import 'package:meet_your_roommate_app/user_matching/domain/entity/team.dart';

class ListAllTeamsPage extends StatefulWidget {
  final List<Team> teams;
  const ListAllTeamsPage({super.key, required this.teams});

  @override
  State<ListAllTeamsPage> createState() => _ListAllTeamsPageState();
}

class _ListAllTeamsPageState extends State<ListAllTeamsPage> {
  @override
  Widget build(BuildContext context) {
    return widget.teams.isNotEmpty
        ? Scaffold(
            body: ListView.builder(
                itemCount: widget.teams.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          const CircleProfileAvatar(
                            image:
                                "https://firebasestorage.googleapis.com/v0/b/meet-your-roommate-c7ed7.appspot.com/o/common%2Fteam.png?alt=media&token=4e198f8b-b215-4e76-a8b2-2583e831b039",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text("${widget.teams[index].name}"),
                                Expanded(
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 3,
                                      itemBuilder: ((context, index1) {
                                        return Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: CircleProfileAvatar(
                                            image:
                                                "${widget.teams[index].listRoommates![index1].photoUrl}",
                                            radius: 20,
                                          ),
                                        );
                                      })),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })),
          )
        : const Center(
            child: Text("No hay grupos"),
          );
  }
}
