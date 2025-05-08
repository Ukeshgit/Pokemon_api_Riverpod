import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon/home_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeDex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreen,
        ), //background halka greenish vayo hernu app ma
        appBarTheme: const AppBarTheme(
          //always use this for all the  appbar
          backgroundColor: Colors.red,
          foregroundColor: Colors.white, // for text/icon color
        ),

        //use this for texttheme-> by default also there is some value but now let's cnacel it
        // textTheme: TextTheme(
        //   headlineSmall: TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.red,
        //   ),
        //   headlineLarge: TextStyle(
        //     fontSize: 30,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.red,
        //   ),
        // ),
        textTheme:
            GoogleFonts.quattrocentoTextTheme(), //need to be constructor as well
        // useMaterial3: true, this doesn't work here as well
      ),
      home: const HomeScreen(),
    );
  }
}
