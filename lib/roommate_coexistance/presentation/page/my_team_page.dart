import 'package:flutter/material.dart';

import 'package:meet_your_roommate_app/profile/presentation/widget/circle_avatar_profile_widget.dart';
import 'package:meet_your_roommate_app/user_matching/team_provider.dart';
import 'package:provider/provider.dart';

class MyTeamPage extends StatefulWidget {
  const MyTeamPage({super.key});

  @override
  State<MyTeamPage> createState() => _MyTeamPageState();
}

class _MyTeamPageState extends State<MyTeamPage> {
  @override
  Widget build(BuildContext context) {
    final teamProvider = Provider.of<TeamProvider>(context);
    return teamProvider.team != null
        ? Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 140,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: teamProvider.team!.listRoommates!.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleProfileAvatar(
                                  image:
                                      "${teamProvider.team!.listRoommates![index].photoUrl}",
                                  radius: 50,
                                ),
                                Text(
                                    "${teamProvider.team!.listRoommates![index].name}")
                              ],
                            ),
                          );
                        })),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("View Request"),
                  const SizedBox(
                    height: 10,
                  ),
                  teamProvider.team!.listDuties!.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: teamProvider.team!.listDuties!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "${teamProvider.team!.listDuties![index].title}"),
                                            Text(
                                                "${teamProvider.team!.listDuties![index].status}"),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${teamProvider.team!.listDuties![index].description}",
                                          style: const TextStyle(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const Text("ASSIGNED"),
                                        Expanded(
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: teamProvider
                                                  .team!
                                                  .listDuties![index]
                                                  .listRoommie!
                                                  .length,
                                              itemBuilder: ((context, index1) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  child: CircleProfileAvatar(
                                                    image:
                                                        "${teamProvider.team!.listDuties![index].listRoommie![index1].photoUrl}",
                                                    radius: 25,
                                                  ),
                                                );
                                              })),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }))
                      : const Center(
                          child: Text("No tienes tareas pendejos"),
                        )
                ],
              ),
            ),
          )
        : const Center(
            child: Text("No tienes equipo "),
          );
  }
}
