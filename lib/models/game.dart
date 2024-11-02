import 'dart:convert';
import 'dart:ui';

import 'package:flutter_cl/models/comment.dart';

class Game {
  Game({
    required this.id,
    required this.name,
    required this.image,
    required this.genre,
    required this.description,
    required this.year,
    required this.ratingMember,
    required this.ratingCritic,
    this.color = const Color(0xFF212121),
  });

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      genre: (map['genre'] as List<dynamic>)
          .map((item) => item.toString())
          .toList(),
      description: map['description'] as String,
      year: map['year'] as int,
      ratingMember: map['ratingMember'] as int,
      ratingCritic: map['ratingCritic'] as int,
      color: Color(int.parse(map['color'])),
    );
  }

  factory Game.fromJson(String source) =>
      Game.fromMap(json.decode(source) as Map<String, dynamic>);

  String id;
  String name;
  String image;
  List<String> genre;
  String description;
  int year;
  int ratingMember;
  int ratingCritic;
  Color color;
  List<Comment> comments = [];

  Game copyWith({
    String? id,
    String? name,
    String? image,
    List<String>? genre,
    String? description,
    int? year,
    int? ratingMember,
    int? ratingCritic,
    Color? color,
  }) {
    return Game(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      genre: genre ?? this.genre,
      description: description ?? this.description,
      year: year ?? this.year,
      ratingMember: ratingMember ?? this.ratingMember,
      ratingCritic: ratingCritic ?? this.ratingCritic,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'genre': genre,
      'description': description,
      'year': year,
      'ratingMember': ratingMember,
      'ratingCritic': ratingCritic,
      'color': color.value,
    };
  }

  String toJson() => json.encode(toMap());
}
