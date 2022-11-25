import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/profile/presentation/widget/circle_avatar_profile_widget.dart';
import 'package:meet_your_roommate_app/user_matching/application/roommate_request_service.dart';
import 'package:meet_your_roommate_app/user_matching/domain/entity/roomate_request.dart';

class RoommieRequestWidget extends StatefulWidget {
  final List<RoommateRequest> listRequest;
  final bool isReceived;
  const RoommieRequestWidget(
      {super.key, required this.isReceived, required this.listRequest});

  @override
  State<RoommieRequestWidget> createState() => _RoommieRequestWidgetState();
}

class _RoommieRequestWidgetState extends State<RoommieRequestWidget> {
  RoommateRequestService roommateRequestService =
      locator<RoommateRequestService>();
  @override
  Widget build(BuildContext context) {
    return widget.listRequest.isNotEmpty
        ? ListView.builder(
            itemCount: widget.listRequest.length,
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
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widget.isReceived
                                  ? Text(
                                      "${widget.listRequest[index].studentRequestor!.name}  ${widget.listRequest[index].studentRequestor!.surname}")
                                  : Text(
                                      "${widget.listRequest[index].studentRequested!.name}  ${widget.listRequest[index].studentRequested!.surname}"),
                              const SizedBox(
                                height: 5,
                              ),
                              widget.isReceived
                                  ? Text(
                                      "${widget.listRequest[index].studentRequestor!.age}")
                                  : Text(
                                      "${widget.listRequest[index].studentRequestor!.age}"),
                            ],
                          ),
                        ),
                      ),
                      widget.isReceived
                          ? Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.green,
                                      width: 2,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.green,
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
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.red,
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
