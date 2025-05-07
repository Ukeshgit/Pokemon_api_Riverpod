import 'package:flutter/material.dart';
import 'package:pokemon/home_screen.dart'; // Make sure this import path is correct.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeDex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),//this doesn't work here
        appBarTheme: const AppBarTheme(
          //always use this for all the  appbar
          backgroundColor: Colors.red,
          foregroundColor: Colors.white, // for text/icon color
        ),
        //use this for texttheme-> by default also there is some value
        textTheme: TextTheme(
          headlineSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          headlineLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),

        // useMaterial3: true, this doesn't work here as well
      ),
      home: const HomeScreen(),
    );
  }
}
