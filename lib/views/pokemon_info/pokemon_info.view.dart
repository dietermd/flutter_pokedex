import 'package:flutter/material.dart';
import 'package:flutter_pokedex/providers/current_pokemon.provider.dart';
import 'package:flutter_pokedex/views/pokemon_info/pokemon_info_sliver_app_bar.view.dart';
import 'package:flutter_pokedex/views/pokemon_info/tabs/pokemon_info_about_tab.view.dart';
import 'package:flutter_pokedex/views/pokemon_info/tabs/pokemon_info_base_stats_tab.view.dart';
import 'package:flutter_pokedex/views/pokemon_info/tabs/pokemon_info_evolution_tab.view.dart';
import 'package:provider/provider.dart';

class PokemonInfoView extends StatelessWidget {
  const PokemonInfoView({ Key? key }) : super(key: key);  

  final List<Tab> _tabList = const [
    Tab(text: 'About'),
    Tab(text: 'Base Stats'),
    Tab(text: 'Evolution'),
    Tab(text: 'Moves')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Consumer<CurrentPokemonProvider>(
          builder: (context, currentPokemonProvider, child) => AppBar(
            backgroundColor: currentPokemonProvider.currentPokemon.typeColor,
          )
        ),
      ),
      body: DefaultTabController(
        length: _tabList.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSafeArea(
                top: false,
                sliver: Consumer<CurrentPokemonProvider>(
                  builder: (context, currentPokemonProvider, child) => PokemonInfoSliverAppBarView(
                    currentPokemon: currentPokemonProvider.currentPokemon,
                    tabList: _tabList,
                  )
                ),
              ),
            )
          ],
          body: Consumer<CurrentPokemonProvider>(
            builder: (context, currentPokemonProvider, child) => TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                PokemonInfoAboutTabView(currentPokemon: currentPokemonProvider.currentPokemon),
                PokemonInfoBaseStatsView(currentPokemon: currentPokemonProvider.currentPokemon),
                PokemonInfoEvolutionTabView(currentPokemon: currentPokemonProvider.currentPokemon),
                Container(),
              ]
            ),
          )
          
        ),
      ),
    );
  }
}