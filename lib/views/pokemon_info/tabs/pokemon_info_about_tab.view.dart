import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.model.dart';

class PokemonInfoAboutTabView extends StatelessWidget {
  const PokemonInfoAboutTabView({ Key? key, required this.currentPokemon }) : super(key: key);

  final Pokemon currentPokemon;

  static const _mainSpacing = SizedBox(height: 24.0);
  static const _breedingInfoSpacing = SizedBox(height: 16.0);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          currentPokemon.xdescription,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontWeight: FontWeight.bold)
        ),
        _mainSpacing,
        SizedBox(
          height: 80.0,
          child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Height:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(currentPokemon.height)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Weigth:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(currentPokemon.weight)
                  ],
                )
              ],
            ),
          ),
        ),
        _mainSpacing,
        const Text(
          'Breeding',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        _mainSpacing,
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('Gender', style: TextStyle(fontWeight: FontWeight.bold)),
                  _breedingInfoSpacing,
                  Text('Egg Groups', style: TextStyle(fontWeight: FontWeight.bold)),
                  _breedingInfoSpacing,
                  Text('Egg Cycle', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(width: 24.0),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  currentPokemon.genderless == 0 ? Text('♂️ ${currentPokemon.malePercentage}  ♀️ ${currentPokemon.femalePercentage}') : const Text('Genderless'),
                  _breedingInfoSpacing,
                  Text(currentPokemon.eggGroups),
                  _breedingInfoSpacing,
                  Text(currentPokemon.eggGroups),
                ],
              ),
            )
          ]
        )
      ],
    );
  }
}