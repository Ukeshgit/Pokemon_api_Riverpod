import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/app/home/model/pokemon_list_model.dart';
import 'package:pokemon/app/home/view/copy_with.dart';
import 'package:pokemon/data/provider/pokemon_data_provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PokemonListTile extends ConsumerWidget {
  final String pokemonUrl;

  PokemonListTile({super.key, required this.pokemonUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(
      pokemonDataProvider(pokemonUrl),
    ); //pokemondataprovider will calls pokemon class inside the pokemonlistdata

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
      child: ListTile(
        leading:
            pokemon != null
                ? CircleAvatar(
                  backgroundImage: NetworkImage(
                    pokemon.sprites!.frontDefault.toString(),
                  ),
                )
                : CircleAvatar(),
        title: Text(pokemon?.name!.toUpperCase() ?? 'Loading...'),
        subtitle: Text("Has ${pokemon?.moves!.length.toString() ?? '0'} moves"),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border, color: Colors.red),
        ),
      ),
    );
  }
}
