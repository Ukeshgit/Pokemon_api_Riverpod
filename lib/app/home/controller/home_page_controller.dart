import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon/app/home/model/home_page_data.dart';
import 'package:pokemon/app/home/model/pokemon_list_model.dart';
import 'package:pokemon/data/api_services.dart/http_services.dart';

class HomePageController extends StateNotifier<HomePageData> {
  final GetIt getIt = GetIt.instance;
  late HttpServices _httpServices;
  //statenotifier will manage the homepageData
  HomePageController(super._state) {
    _httpServices = getIt.get<HttpServices>();
    _setup();
  }
  Future<void> _setup() async {
    return loadData();
  }

  Future<void> loadData() async {
    if (state.data == null) {
      Response? response = await _httpServices.get(
        "https://pokeapi.co/api/v2/pokemon/",
      );
      print(response!.data);
      if (response != null) {
        PokemonListData data = PokemonListData.fromJson(response.data);
        state = state.copyWith(
          data: data,
        ); //state will be updated although it is immuatable
      }
    } else {}
  }
}
