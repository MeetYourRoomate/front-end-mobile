import 'package:flutter/material.dart';

class CloseCreatePropertyWidget extends StatelessWidget {
  const CloseCreatePropertyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
  }
}
