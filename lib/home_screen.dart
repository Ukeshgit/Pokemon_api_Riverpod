import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/app/home/controller/home_page_controller.dart';
import 'package:pokemon/app/home/model/page_data.dart';

final homePageProvider = StateNotifierProvider((ref) {
  return HomePageController(HomePageData.initial());
});

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildUi(context));
  }
}

//function
Widget _buildUi(BuildContext context) {
  return SafeArea(
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      padding: (EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.02,
      )),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_allPokemonList(context)],
      ),
    ),
  );
}

//function
Widget _allPokemonList(BuildContext context) {
  return SizedBox(
    width: MediaQuery.sizeOf(context).width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("All Pokemons", style: TextStyle(fontSize: 25)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
          child: ListView.builder(
            itemCount: 0,
            itemBuilder: (context, index) {
              return ListTile();
            },
          ),
        ),
      ],
    ),
  );
}
