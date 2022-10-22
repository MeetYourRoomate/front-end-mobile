import 'package:flutter/material.dart';

class LessorHomePage extends StatefulWidget {
  const LessorHomePage({super.key});

  @override
  State<LessorHomePage> createState() => _LessorHomePageState();
}

class _LessorHomePageState extends State<LessorHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Juan Alberto"),
                      Icon(Icons.notification_important),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20.0),
                  child: Container(
                    height: 100.0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text("Info"),
                            Text("Cosas"),
                            Text("Ver"),
                          ],
                        ),
                        const Icon(Icons.bus_alert_sharp)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blueGrey,
              child: Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Center(child: Text("Agregar")),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
