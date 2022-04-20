import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.model.dart';
import 'package:flutter_pokedex/providers/current_pokemon.provider.dart';
import 'package:flutter_pokedex/providers/pokemon_list.provider.dart';
import 'package:provider/provider.dart';

class PokemonPagesView extends StatefulWidget {
  const PokemonPagesView({ Key? key }) : super(key: key);

  @override
  State<PokemonPagesView> createState() => _PokemonPagesViewState();
}

class _PokemonPagesViewState extends State<PokemonPagesView> {

  late final Pokemon _currentPokemon;
  late final List<Pokemon> _pokemonList;
  late int _currentPokemonPageindex;
  late PageController _pageController;

  @override
  void initState() {
    _currentPokemon = context.read<CurrentPokemonProvider>().currentPokemon;
    _pokemonList = context.read<PokemonListProvider>().pokemonList;
    _currentPokemonPageindex = _pokemonList.indexOf(_currentPokemon);
    _pageController = PageController(
      initialPage: _currentPokemonPageindex
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: _pokemonList.length,
      onPageChanged: (value) {
        _pageController.animateToPage(
          value,
          duration: const Duration(milliseconds: 200),
          curve: Curves.linearToEaseOut
        );
        Pokemon pokemon = _pokemonList[value];
        context.read<CurrentPokemonProvider>().setCurrentPokemon(pokemon);
      },
      itemBuilder: (context, index) {
        Pokemon pokemon = _pokemonList[index];
        return _imageRow(pokemon.id, pokemon.imageurl);
      } ,
    );
  }

  Widget _imageRow(String id, String imageUrl) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: id,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.25,
                child: Image.asset('images/pokeball-logo-transparent.png')
              ),
              CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.fitHeight)
            ],
          ),
        )
      ],
    );
  }
}