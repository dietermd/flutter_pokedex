
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.model.dart';

class CurrentPokemonProvider extends ChangeNotifier {

  CurrentPokemonProvider(this._currentPokemon);

  Pokemon _currentPokemon;
  Pokemon get currentPokemon => _currentPokemon;

  void setCurrentPokemon(Pokemon pokemon) {
    _currentPokemon = pokemon;
    notifyListeners();
  }

}