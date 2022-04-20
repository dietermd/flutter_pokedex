import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/pokemon_type_badge.dart';
import 'package:flutter_pokedex/models/pokemon.model.dart';
import 'package:flutter_pokedex/views/pokemon_info/pokemon_info_pages.view.dart';

class PokemonInfoSliverAppBarView extends StatelessWidget {
  const PokemonInfoSliverAppBarView({ Key? key, required this.currentPokemon, required this.tabList }) : super(key: key);

  final Pokemon currentPokemon;
  final List<Tab> tabList;

  final double _expandedHeight = 350.0;
  final double _scrollOffsetMin = 150.0;
  
  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(builder: (context, constraints) {
      return SliverAppBar(
        pinned: true,
        primary: false,
        centerTitle: true,
        backgroundColor: currentPokemon.typeColor,
        title: _expandedHeight - constraints.scrollOffset < _scrollOffsetMin ? Text(currentPokemon.name) : null,
        expandedHeight: _expandedHeight,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.none,
          background: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: kToolbarHeight,
                  child: SizedBox.shrink(),
                ),
                SizedBox(
                  height: 40.0,
                  child: _nameAndIdRow(currentPokemon.name, currentPokemon.id),
                ),
                SizedBox(
                  height: 25.0,
                  child: _typesAndCategoryRow(currentPokemon.typeofpokemon, currentPokemon.category)
                ),
                const Expanded(
                  flex: 1,
                  child: PokemonPagesView()
                ),
                const SizedBox(
                  height: kToolbarHeight,
                  child: SizedBox.shrink()
                ),
              ],
            ),
          ),
        ),
        bottom: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(32),
            ),
          ),
          flexibleSpace: TabBar(
            labelColor: Colors.black,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.grey[400],
            indicatorColor: currentPokemon.typeColor,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: tabList
          ),
        ),
      );
    });
  }

  Widget _nameAndIdRow(String name, String id) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,

          ),
        ),
        Text(
          id,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _typesAndCategoryRow(List<String> typeList, String category) {
    return Row(
      children: [
        ...typeList.map<Widget>((type) => PokemonTypeBadge(
          pokemonType: type,
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          margin: const EdgeInsets.only(right: 8.0),
        )).toList(),
        const Spacer(),
        Text(category, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
      ]
    );
  }
}