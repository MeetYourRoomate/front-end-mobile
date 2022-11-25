import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';

class Duty {
  final String? _id;
  final String? _title;
  final String? _description;
  final String? _status;
  final String? _dateLine;
  final List<UserProfile>? _listRoommate;

  Duty(
    this._id,
    this._title,
    this._description,
    this._status,
    this._dateLine,
    this._listRoommate,
  );

  String? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get status => _status;
  String? get dateLine => _dateLine;
  List<UserProfile>? get listRoommie => _listRoommate;
}
