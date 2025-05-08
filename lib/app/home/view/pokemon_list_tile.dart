import 'package:flutter/material.dart';

class PokemonListTile extends StatelessWidget {
  final String pokemonUrl;
  const PokemonListTile({required this.pokemonUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(pokemonUrl));
  }
}
