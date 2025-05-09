import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon/app/home/model/pokemon_list_model.dart';
import 'package:pokemon/data/api_services.dart/http_services.dart';

final pokemonDataProvider = FutureProvider.family<Pokemon?, String>((
  ref,
  url,
) async {
  HttpServices httpServices = GetIt.instance.get<HttpServices>();
  Response? res = await httpServices.get(url);
  if (res != null) {
    return Pokemon.fromJson(res.data);
  }
  return null;
});
