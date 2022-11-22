import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_request.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/widget/lessor_message_widget.dart';

class ListLessorMessagePage extends StatefulWidget {
  final List<RentalRequest> listRental;
  final bool isPending;
  const ListLessorMessagePage(
      {super.key, required this.isPending, required this.listRental});

  @override
  State<ListLessorMessagePage> createState() => _ListLessorMessagePageState();
}

class _ListLessorMessagePageState extends State<ListLessorMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: ListView.builder(
        itemCount: widget.listRental.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: LessorMessageWidget(
              isPending: widget.isPending,
              rentalRequest: widget.listRental[index],
            ),
          );
        }),
      ),
    );
  }
}
