import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/app/home/model/pokemon_list_model.dart';
import 'package:pokemon/data/provider/pokemon_data_provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PokemonListTile extends ConsumerWidget {
  final String pokemonUrl;

  const PokemonListTile({super.key, required this.pokemonUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonDataProvider(pokemonUrl));

    return pokemonAsync.when(
      data: (pokemon) => _buildTile(pokemon, isLoading: false),
      loading: () => _buildTile(null, isLoading: true),
      error:
          (error, _) => ListTile(
            title: Text('Error: $error'),
            leading: const Icon(Icons.error, color: Colors.red),
          ),
    );
  }

  Widget _buildTile(Pokemon? pokemon, {required bool isLoading}) {
    return Skeletonizer(
      enabled: isLoading,
      child: ListTile(title: Text(pokemon?.name ?? 'Loading...')),
    );
  }
}
