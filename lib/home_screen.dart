import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AMO")),
      body: Center(
        child: Text(
          "Welcome to PokeDex",
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: Colors.orange),
        ),
      ),
    );
  }
}
