import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/app/home/controller/home_page_controller.dart';
import 'package:pokemon/app/home/model/home_page_data.dart';
import 'package:pokemon/app/home/view/pokemon_list_tile.dart';

final homePageControllerProvider =
    StateNotifierProvider<HomePageController, HomePageData>((ref) {
      return HomePageController(HomePageData.initial());
    });

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late HomePageController _homePageController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _homePageController = ref.read(homePageControllerProvider.notifier);
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      print("End of list");
      _homePageController.loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final homePageData = ref.watch(homePageControllerProvider);

    return Scaffold(body: _buildUi(context, homePageData));
  }

  Widget _buildUi(BuildContext context, HomePageData homePageData) {
    return SafeArea(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_allPokemonList(context, homePageData)],
        ),
      ),
    );
  }

  Widget _allPokemonList(BuildContext context, HomePageData homePageData) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("All Pokemons", style: TextStyle(fontSize: 25)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: homePageData.data?.results?.length ?? 0,
              itemBuilder: (context, index) {
                final url = homePageData.data?.results?[index].url ?? "";
                return PokemonListTile(pokemonUrl: url);
              },
            ),
          ),
        ],
      ),
    );
  }
}
