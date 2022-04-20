import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.model.dart';
import 'package:flutter_pokedex/providers/pokemon_list.provider.dart';
import 'package:flutter_pokedex/views/Pokedex/pokedex_card.view.dart';
import 'package:provider/provider.dart';

class PokedexGridView extends StatelessWidget {
  const PokedexGridView({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<PokemonListProvider>(
        builder: (context, pokemonListProvider, child) => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: 1.5,
          ),
          itemCount: pokemonListProvider.searchPokemonList.length,
          itemBuilder: (context, index) {
            Pokemon pokemon = pokemonListProvider.searchPokemonList[index];            
            return PokedexCardView(pokemon: pokemon);
          },
        )
      ),
    );
  }  
}