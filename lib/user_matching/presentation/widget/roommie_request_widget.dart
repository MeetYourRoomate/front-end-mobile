import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/profile/presentation/widget/circle_avatar_profile_widget.dart';
import 'package:meet_your_roommate_app/user_matching/domain/entity/roomate_request.dart';

class RoommieRequestWidget extends StatelessWidget {
  final List<RoommateRequest> listRequest;
  final bool isReceived;
  const RoommieRequestWidget(
      {super.key, required this.isReceived, required this.listRequest});

  @override
  Widget build(BuildContext context) {
    return listRequest.isNotEmpty
        ? ListView.builder(
            itemCount: listRequest.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsApp.primaryColor2,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleProfileAvatar(
                        image: "",
                        radius: 40,
                      ),
                      Column(
                        children: [
                          isReceived
                              ? Text(
                                  "${listRequest[index].studentRequestor!.name}  ${listRequest[index].studentRequestor!.surname}")
                              : Text(
                                  "${listRequest[index].studentRequested!.name}  ${listRequest[index].studentRequested!.surname}"),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("30 anios"),
                        ],
                      ),
                      isReceived
                          ? Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: ColorsApp.primaryColor2,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: ColorsApp.primaryColor2,
                                      width: 2,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: ColorsApp.primeryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                  child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              )),
                            )
                    ],
                  ),
                ),
              );
            }))
        : const Center(
            child: Text("You haven't requests"),
          );
  }
}
