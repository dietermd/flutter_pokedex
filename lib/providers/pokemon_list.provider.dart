import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.model.dart';

class PokemonListProvider extends ChangeNotifier {

  PokemonListProvider(this._pokemonList) {
    _searchPokemonList = _pokemonList;
  }

  final List<Pokemon> _pokemonList;
  UnmodifiableListView<Pokemon> get pokemonList => UnmodifiableListView(_pokemonList);

  late List<Pokemon> _searchPokemonList;
  UnmodifiableListView<Pokemon> get searchPokemonList => UnmodifiableListView(_searchPokemonList);

  void searchPokemon(String searchValue) {
    _searchPokemonList = searchValue.isEmpty ?
      _pokemonList :
      _pokemonList.where((p) => p.name.toLowerCase().contains(searchValue) || p.id.contains(searchValue)).toList();
    notifyListeners();
  }
  
}