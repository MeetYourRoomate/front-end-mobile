import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';
import 'package:meet_your_roommate_app/user_matching/domain/entity/duty.dart';

class Team {
  final int? _id;
  final String? _name;
  final List<UserProfile> _listRoommates;
  final List<Duty> _listDuties;

  Team(
    this._id,
    this._name,
    this._listRoommates,
    this._listDuties,
  );

  int? get id => _id;
  String? get name => _name;
  List<UserProfile>? get listRoommates => _listRoommates;
  List<Duty>? get listDuties => _listDuties;
}
