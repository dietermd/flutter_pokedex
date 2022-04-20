import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/pokemon_type_badge.dart';
import 'package:flutter_pokedex/models/pokemon.model.dart';

class PokemonInfoBaseStatsView extends StatelessWidget {
  const PokemonInfoBaseStatsView({ Key? key, required this.currentPokemon }) : super(key: key);

  final Pokemon currentPokemon;
  static const _spacing = SizedBox(height: 16.0);
  static const _doubleSpacing = SizedBox(height: 32.0);
  static const _textStyle = TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _baseStatsTabRow('Hp', currentPokemon.hp),
        _spacing,
        _baseStatsTabRow('Attack', currentPokemon.attack),
        _spacing,
        _baseStatsTabRow('Defense', currentPokemon.defense),
        _spacing,
        _baseStatsTabRow('Sp.Atk', currentPokemon.specialAttack),
        _spacing,
        _baseStatsTabRow('Sp.Def', currentPokemon.specialDefense),
        _spacing,
        _baseStatsTabRow('Speed', currentPokemon.speed),
        _spacing,
        _baseStatsTabRow('Total', currentPokemon.total),

        _doubleSpacing,

        const Text('Type Weaknesses', style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold)),
        _spacing,
        Text('Types that are effective against ${currentPokemon.name.toLowerCase()}.'),
        _spacing,
        Wrap(
          direction: Axis.horizontal,
          runSpacing: 5.0,
          children: currentPokemon.weaknesses.map<Widget>((type) => PokemonTypeBadge(
            pokemonType: type,
            useTypeColor: true,
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
            margin: const EdgeInsets.only(right: 8.0),
          )).toList(),
        )

      ],
    );
  }

  Widget _baseStatsTabRow(String statName, int statValue) {
    final percentage = statName == 'Total' ? statValue / 600 : statValue / 100;
    return Row(
      children: [
        Expanded(flex: 2, child: Text(statName, style: _textStyle)),
        const Spacer(flex: 1),
        Expanded(flex: 2, child: Text(statValue.toString(), style: _textStyle)),
        Expanded(flex: 5, child: LinearProgressIndicator(value: percentage, color: currentPokemon.typeColor, backgroundColor: Colors.grey[200]))
      ],
    );
  }
}