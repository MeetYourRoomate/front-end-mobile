import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';

class TeamRequest {
  final String? _id;
  final String? _status;
  final UserProfile? _studentRequestor;

  TeamRequest(this._id, this._status, this._studentRequestor);

  String? get id => _id;
  String? get status => _status;
  UserProfile? get studentRequestor => _studentRequestor;
}
