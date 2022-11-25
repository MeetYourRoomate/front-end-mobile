import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/user_matching/application/roommate_request_service.dart';

class StatusRequest extends StatefulWidget {
  final int id;
  final String status;
  const StatusRequest({super.key, required this.status, required this.id});

  @override
  State<StatusRequest> createState() => _StatusRequestState();
}

class _StatusRequestState extends State<StatusRequest> {
  RoommateRequestService roommateRequestService =
      locator<RoommateRequestService>();
  @override
  Widget build(BuildContext context) {
    switch (widget.status) {
      case "PENDING":
        return Row(
          children: [
            InkWell(
              onTap: () async {
                final data =
                    await roommateRequestService.declineRequest(widget.id);
                print(data.status);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: ColorsApp.primeryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorsApp.primeryColor,
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
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () async {
                final data =
                    await roommateRequestService.acceptRequest(widget.id);
                print(data.status);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.black,
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
            ),
          ],
        );
      case "ACCEPTED":
        return Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: Colors.black,
              )),
          child: const Center(
              child: Icon(
            Icons.check,
            color: Colors.black,
          )),
        );
      case "DECLINED":
        return Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: Colors.black,
              )),
          child: const Center(
              child: Icon(
            Icons.close,
            color: Colors.black,
          )),
        );
      default:
        return Container(
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
        );
    }
  }
}
