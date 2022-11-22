import 'package:flutter/cupertino.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/rental_request_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_request.dart';

class PropertyRequestProvider with ChangeNotifier {
  //lessor
  List<RentalRequest> _listRequestLessor = [];
  List<RentalRequest> _listPending = [];
  List<RentalRequest> _listDecline = [];
  List<RentalRequest> _listAcepted = [];

  //student
  List<RentalRequest> _listRequestStudent = [];

  List<RentalRequest> get listRequestLessor => _listRequestLessor;
  List<RentalRequest> get listRequestStudent => _listRequestStudent;
  List<RentalRequest> get listPending => _listPending;
  List<RentalRequest> get listDecline => _listDecline;
  List<RentalRequest> get listAcepted => _listAcepted;

  Future<void> setRequestLessor(String uid) async {
    RentalRequestService rentalRequestService = locator<RentalRequestService>();

    _listRequestLessor =
        await rentalRequestService.getRentalRequestsByLessorId(uid);

    if (_listRequestLessor.isNotEmpty) {
      _listPending = _listRequestLessor
          .where((element) => element.status == "PENDING")
          .toList();
      _listDecline = _listRequestLessor
          .where((element) => element.status == "DECLINED")
          .toList();
      _listAcepted = _listRequestLessor
          .where((element) => element.status == "ACCEPTED")
          .toList();
    }
    notifyListeners();
  }

  Future<void> setRequestStudent(String uid) async {
    RentalRequestService rentalRequestService = locator<RentalRequestService>();

    _listRequestStudent = await rentalRequestService.getRequestByUserId(uid);

    notifyListeners();
  }
}
