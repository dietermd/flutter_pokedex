import 'package:flutter/material.dart';
import 'package:flutter_pokedex/providers/pokemon_list.provider.dart';
import 'package:provider/provider.dart';


class PokedexAppBar extends StatefulWidget with PreferredSizeWidget{
  const PokedexAppBar({ Key? key }) : super(key: key);

  @override
  _PokedexAppBarState createState() => _PokedexAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _PokedexAppBarState extends State<PokedexAppBar> {

  var _showSearch = false;

  @override
  Widget build(BuildContext context) {
    if (!_showSearch) {
      return AppBar(
        title: const Text('Pokedex'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => setState(() {
              _showSearch = !_showSearch;
            }),
            icon: const Icon(Icons.search),
          )
        ],
      );
    }

    return AppBar(
      title: TextField(
        onChanged: context.read<PokemonListProvider>().searchPokemon,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => setState(() {
            _showSearch = !_showSearch;
            context.read<PokemonListProvider>().searchPokemon('');
          }),
          icon: const Icon(Icons.close)
        )
      ],
    );
  }
}