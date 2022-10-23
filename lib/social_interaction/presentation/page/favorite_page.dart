import 'package:flutter/material.dart';
import 'package:meet_your_roommate/iam/user_provider.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Center(
        child: Container(
          child: userProvider.isLogged
              ? const Text("Estamos Trabajando")
              : const Text("Inicia Sesion para ver"),
        ),
      ),
    );
  }
}
