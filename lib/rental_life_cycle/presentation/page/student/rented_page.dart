import 'package:flutter/material.dart';

class RentedPage extends StatefulWidget {
  const RentedPage({super.key});

  @override
  State<RentedPage> createState() => _RentedPageState();
}

class _RentedPageState extends State<RentedPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Rented Page"),
    );
  }
}
