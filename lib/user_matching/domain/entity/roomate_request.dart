import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';

class RoommateRequest {
  final int? _id;
  final String? _status;
  final UserProfile? _studentRequestor;
  final UserProfile? _studentRequested;

  RoommateRequest(
    this._id,
    this._status,
    this._studentRequestor,
    this._studentRequested,
  );

  int? get id => _id;
  String? get status => _status;
  UserProfile? get studentRequestor => _studentRequestor;
  UserProfile? get studentRequested => _studentRequested;
}
