import 'dart:convert';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_pokedex/models/pokemon.model.dart';

class PokedexRepository {
  
  Future<List<Pokemon>> getPokemonList() async {
    final file = await DefaultCacheManager().getSingleFile('https://raw.githubusercontent.com/scitbiz/flutter_pokedex/master/assets/pokemons.json');
    final fileStr = await file.readAsString();
    final Iterable list = jsonDecode(fileStr);
    final pokemons = List<Pokemon>.from(list.map((model) => Pokemon.fromJson(model)));
    return pokemons;
  }

}