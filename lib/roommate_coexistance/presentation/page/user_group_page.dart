import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:meet_your_roommate_app/roommate_coexistance/presentation/page/user_list_group_page.dart';
import 'package:meet_your_roommate_app/roommate_coexistance/presentation/page/user_not_group_page.dart';

class UserGroupPage extends StatefulWidget {
  const UserGroupPage({super.key});

  @override
  State<UserGroupPage> createState() => _UserGroupPageState();
}

class _UserGroupPageState extends State<UserGroupPage> {
  List data = [];
  @override
  Widget build(BuildContext context) {
    return data.isEmpty ? const UserNotGroupPage() : const UserListGroupPage();
  }
}
