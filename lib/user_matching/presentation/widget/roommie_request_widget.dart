import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/profile/presentation/widget/circle_avatar_profile_widget.dart';
import 'package:meet_your_roommate_app/user_matching/application/roommate_request_service.dart';
import 'package:meet_your_roommate_app/user_matching/domain/entity/roomate_request.dart';
import 'package:meet_your_roommate_app/user_matching/presentation/widget/status_request.dart';

class RoommieRequestWidget extends StatefulWidget {
  final List<RoommateRequest> listRequest;
  final bool isSent;
  const RoommieRequestWidget(
      {super.key, required this.isSent, required this.listRequest});

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
                              widget.isSent
                                  ? Text(
                                      "${widget.listRequest[index].studentRequested!.name}  ${widget.listRequest[index].studentRequested!.surname}")
                                  : Text(
                                      "${widget.listRequest[index].studentRequestor!.name}  ${widget.listRequest[index].studentRequestor!.surname}"),
                              const SizedBox(
                                height: 5,
                              ),
                              widget.isSent
                                  ? Text(
                                      "${widget.listRequest[index].studentRequested!.age}")
                                  : Text(
                                      "${widget.listRequest[index].studentRequested!.age}"),
                            ],
                          ),
                        ),
                      ),
                      widget.isSent
                          ? Container(
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
                          : StatusRequest(
                              status: widget.listRequest[index].status!,
                              id: widget.listRequest[index].id!)
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
