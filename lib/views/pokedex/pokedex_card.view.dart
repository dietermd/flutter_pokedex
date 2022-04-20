import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/pokemon_type_badge.dart';
import 'package:flutter_pokedex/models/pokemon.model.dart';
import 'package:flutter_pokedex/providers/current_pokemon.provider.dart';
import 'package:flutter_pokedex/views/pokemon_info/pokemon_info.view.dart';
import 'package:provider/provider.dart';

class PokedexCardView extends StatelessWidget {
  const PokedexCardView({ Key? key, required this.pokemon }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: pokemon.typeColor,
      borderRadius: BorderRadius.circular(16.0),
      child: InkWell(
        onTap: () {
          Provider.of<CurrentPokemonProvider>(context, listen: false).setCurrentPokemon(pokemon);
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PokemonInfoView()));
        },
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: _pokemonNameAndId(pokemon.name, pokemon.id),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: _pokemonTypeBadges(pokemon.typeofpokemon),
                  ),
                  Expanded(
                    flex: 1,
                    child: _pokemonImage(pokemon.id, pokemon.imageurl),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }

  Widget _pokemonNameAndId(String name, String id) {
    const _textStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Text(name, style: _textStyle),
          Text(id, style: _textStyle),
        ],
      ),
    );
  }

  Widget _pokemonTypeBadges(List<String> typeList) {    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: typeList.map((type) => PokemonTypeBadge(
        pokemonType: type,
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 12.0),
        margin: const EdgeInsets.only(bottom: 6.0),
      )).toList(),
    );
  }

  Widget _pokemonImage(String id, String imageUrl) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Hero(
          tag: id,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.25,
                child: Image.asset('images/pokeball-logo-transparent.png'),  
              ),
              CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.fitHeight,)
            ],
          ),
        ),
      ],
    );
  }
}