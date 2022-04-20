import 'package:flutter_pokedex/models/pokemon.model.dart';
import 'package:flutter_pokedex/repositories/pokedex.repository.dart';

class PokedexController {
  
  final _pokedexRepository = PokedexRepository();

  Future<List<Pokemon>> getPokemonList() async {
    return await _pokedexRepository.getPokemonList();
  }
}