import 'package:flutter/cupertino.dart';

class Game {
  String title;
  double value;
  String image;

  Game({@required this.title, @required this.value, @required this.image});
}

List<Game> games = [
  Game(title: "Assassins", value: 95, image: "images/assassins.png"),
  Game(title: "Spiderman", value: 89, image: "images/spiderman.png"),
  Game(title: "Sackboy", value: 70, image: "images/sackboy.png")
];
