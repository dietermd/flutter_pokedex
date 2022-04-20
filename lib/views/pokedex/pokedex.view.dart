import 'package:flutter/material.dart';
import 'package:flutter_pokedex/views/Pokedex/pokedex_app_bar.view.dart';
import 'package:flutter_pokedex/views/Pokedex/pokedex_grid.view.dart';


class PokedexView extends StatelessWidget {
  const PokedexView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PokedexAppBar(),
      body: Center(
        child: PokedexGridView(),
      ),
    );
  }
}