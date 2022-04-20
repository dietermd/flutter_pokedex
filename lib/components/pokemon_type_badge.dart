import 'package:flutter/material.dart';
import 'package:flutter_pokedex/utility/utility.dart';

class PokemonTypeBadge extends StatelessWidget {
  const PokemonTypeBadge({ Key? key, required this.pokemonType, this.useTypeColor = false, this.padding, this.margin }) : super(key: key);

  final String pokemonType;
  final bool useTypeColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    Color color = useTypeColor ? Utility.typeColor[pokemonType]! : Colors.white; 
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: color.withOpacity(0.2)
      ),
      padding: padding,
      margin: margin,
      child: Text(pokemonType, style: TextStyle(color: color)),
    );
  }
}