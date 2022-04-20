import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.model.dart';
import 'package:flutter_pokedex/providers/current_pokemon.provider.dart';
import 'package:flutter_pokedex/providers/pokemon_list.provider.dart';
import 'package:flutter_pokedex/views/error.view.dart';
import 'package:flutter_pokedex/views/loading.view.dart';
import 'package:flutter_pokedex/views/Pokedex/pokedex.view.dart';
import 'package:provider/provider.dart';

import 'controllers/pokedex.controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _pokedexControler = PokedexController();  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return FutureBuilder(
      future: _pokedexControler.getPokemonList(),
      builder: (context, AsyncSnapshot<List<Pokemon>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PokedexMaterialApp(home: LoadingView());
        } else if (snapshot.hasError || !snapshot.hasData) {
          return const PokedexMaterialApp(home: ErrorView());
        } else {
          return MultiProvider(              
            providers: [
              ChangeNotifierProvider(create: (context) => PokemonListProvider(snapshot.data!)),
              ChangeNotifierProvider(create: (context) => CurrentPokemonProvider(snapshot.data!.first))
            ],
            child: const PokedexMaterialApp(home: PokedexView()),
          );
        }
      }
    );
  }
}

class PokedexMaterialApp extends StatelessWidget {
  const PokedexMaterialApp({ Key? key, required this.home }) : super(key: key);

  final Widget home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: home,
    );
  }
}
