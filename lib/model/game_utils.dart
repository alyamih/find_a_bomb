import 'package:flutter/material.dart';

class Game {
  List<String>? gameImg;
  int? currentLevel;

  final String hiddenCardpath = "assets/hidden_bomb.png";
  List<String> cards_list = [];
  int? cardCount;

  //methods
  void initGame() {
    gameImg = List.generate(cardCount!, (index) => hiddenCardpath);
  }

  void initCardsList() {
    if (currentLevel == 1) {
      cardCount = 4;
      cards_list = [
        "assets/bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
      ];
    } else if (currentLevel == 2) {
      cardCount = 6;
      cards_list = [
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/bomb.png",
      ];
    } else if (currentLevel == 3) {
      cardCount = 9;
      cards_list = [
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
      ];
    } else if (currentLevel == 4) {
      cardCount = 12;
      cards_list = [
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/bomb.png",
        "assets/hidden_bomb.png",
      ];
    } else if (currentLevel == 5) {
      cardCount = 15;
      cards_list = [
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
        "assets/hidden_bomb.png",
      ];
    }
  }
}
