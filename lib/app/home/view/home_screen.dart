import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/app/home/controller/home_page_controller.dart';
import 'package:pokemon/app/home/model/home_page_data.dart';
import 'package:pokemon/app/home/view/pokemon_list_tile.dart';

final homePageControllerProvider = StateNotifierProvider((ref) {
  return HomePageController(HomePageData.initial());
}); //rebuild when state changes

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final _homePageController = ref.watch(homePageControllerProvider.notifier);
    final _homePageData = ref.watch(homePageControllerProvider);

    return Scaffold(body: _buildUi(context, _homePageData));
  }

  Widget _buildUi(BuildContext context, HomePageData _homePageData) {
    return SafeArea(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_allPokemonList(context, _homePageData)],
        ),
      ),
    );
  }

  Widget _allPokemonList(BuildContext context, HomePageData _homePageData) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("All Pokemons", style: TextStyle(fontSize: 25)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView.builder(
              itemCount: _homePageData.data?.results?.length ?? 0,
              itemBuilder: (context, index) {
                return PokemonListTile(
                  pokemonUrl: _homePageData.data?.results?[index].url ?? "",
                ); // Replace with actual data
              },
            ),
          ),
        ],
      ),
    );
  }
}

  //How this works?

  // HomeScreen is instantiated first (as it is part of your widget tree).
  // Then, when _buildUi() is executed and ref.watch(homePageControllerProvider.notifier) is called, HomePageController is instantiated.
  // This is lazy initialization — Riverpod only creates the controller when needed.

