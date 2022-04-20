import 'package:flutter/material.dart';
import 'package:flutter_pokedex/utility/utility.dart';

class Pokemon {
  String name;
  String id;
  String imageurl;
  String xdescription;
  String ydescription;
  String height;
  String category;
  String weight;
  List<String> typeofpokemon;
  List<String> weaknesses;
  List<String> evolutions;
  List<String> abilities;
  int hp;
  int attack;
  int defense;
  int specialAttack;
  int specialDefense;
  int speed;
  int total;
  String malePercentage;
  String femalePercentage;
  int genderless;
  String cycles;
  String eggGroups;
  String evolvedfrom;
  String reason;
  String baseExp;

  Color get typeColor => typeofpokemon.isEmpty ? Colors.white : Utility.typeColor[typeofpokemon.first]!;

  Pokemon(
      {required this.name,
      required this.id,
      required this.imageurl,
      required this.xdescription,
      required this.ydescription,
      required this.height,
      required this.category,
      required this.weight,
      required this.typeofpokemon,
      required this.weaknesses,
      required this.evolutions,
      required this.abilities,
      required this.hp,
      required this.attack,
      required this.defense,
      required this.specialAttack,
      required this.specialDefense,
      required this.speed,
      required this.total,
      required this.malePercentage,
      required this.femalePercentage,
      required this.genderless,
      required this.cycles,
      required this.eggGroups,
      required this.evolvedfrom,
      required this.reason,
      required this.baseExp});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: json['id'],
      imageurl: json['imageurl'],
      xdescription: json['xdescription'],
      ydescription: json['ydescription'],
      height: json['height'],
      category: json['category'],
      weight: json['weight'],
      typeofpokemon: json['typeofpokemon'].cast<String>(),
      weaknesses: json['weaknesses'].cast<String>(),
      evolutions: json['evolutions'].cast<String>(),
      abilities: json['abilities'].cast<String>(),
      hp: json['hp'],
      attack: json['attack'],
      defense: json['defense'],
      specialAttack: json['special_attack'],
      specialDefense: json['special_defense'],
      speed: json['speed'],
      total: json['total'],
      malePercentage: json['male_percentage'] ?? 'Unknown',
      femalePercentage: json['female_percentage'] ?? 'Unknown',
      genderless: json['genderless'],
      cycles: json['cycles'],
      eggGroups: json['egg_groups'],
      evolvedfrom: json['evolvedfrom'],
      reason: json['reason'],
      baseExp: json['base_exp'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['imageurl'] = imageurl;
    data['xdescription'] = xdescription;
    data['ydescription'] = ydescription;
    data['height'] = height;
    data['category'] = category;
    data['weight'] = weight;
    data['typeofpokemon'] = typeofpokemon;
    data['weaknesses'] = weaknesses;
    data['evolutions'] = evolutions;
    data['abilities'] = abilities;
    data['hp'] = hp;
    data['attack'] = attack;
    data['defense'] = defense;
    data['special_attack'] = specialAttack;
    data['special_defense'] = specialDefense;
    data['speed'] = speed;
    data['total'] = total;
    data['male_percentage'] = malePercentage;
    data['female_percentage'] = femalePercentage;
    data['genderless'] = genderless;
    data['cycles'] = cycles;
    data['egg_groups'] = eggGroups;
    data['evolvedfrom'] = evolvedfrom;
    data['reason'] = reason;
    data['base_exp'] = baseExp;
    return data;
  }
}