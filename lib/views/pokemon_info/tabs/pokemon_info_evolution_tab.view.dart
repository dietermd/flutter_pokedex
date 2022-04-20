import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.model.dart';
import 'package:flutter_pokedex/providers/pokemon_list.provider.dart';
import 'package:provider/provider.dart';

class PokemonInfoEvolutionTabView extends StatelessWidget {
  const PokemonInfoEvolutionTabView({ Key? key, required this.currentPokemon }) : super(key: key);

  final Pokemon currentPokemon;

  @override
  Widget build(BuildContext context) {
    final List<Pokemon> pokemonEvolutions = context.read<PokemonListProvider>().pokemonList
      .where((pokemon) => currentPokemon.evolutions.contains(pokemon.id))
      .toList();
    final List<Widget> _evolutions = [];

    if (pokemonEvolutions.length == 1) {
      _evolutions.add(
        Column(children: [_evolutionAvatar(currentPokemon), const Text('Unevolved')])
      );
    }
    else {
      for (var x in pokemonEvolutions) {
        pokemonEvolutions.where((y) => y.evolvedfrom == x.id).forEach((z) =>
          _evolutions.addAll([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1, child: Column(children: [_evolutionAvatar(x), Text(x.name)])),
                Expanded(flex: 2, child: Column(children: [const Icon(Icons.arrow_right_alt), Text(z.reason, style: const TextStyle(fontSize: 10.0))])),
                Expanded(flex: 1, child: Column(children: [_evolutionAvatar(z), Text(z.name)]))
              ]
            ),
            const Divider(height: 24.0)
          ])
        );
      }
      _evolutions.removeLast();
    }

    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        const Text('Evolution Chain', style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold)),
        const SizedBox(height: 30.0),
        ..._evolutions
      ],
    );
  }

  Widget _evolutionAvatar(Pokemon pokemon) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 3,
          color: pokemon.typeColor
        )
      ),
      child: CachedNetworkImage(imageUrl: pokemon.imageurl, fit: BoxFit.contain)
    );
  }
}