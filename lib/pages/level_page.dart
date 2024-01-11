import 'package:find_a_bomb/model/level_item.dart';
import 'package:find_a_bomb/model/user_item.dart';
import 'package:find_a_bomb/pages/levels_page.dart';
import 'package:find_a_bomb/pages/lvl_over_page.dart';
import 'package:find_a_bomb/pages/settings_page.dart';
import 'package:find_a_bomb/pages/start_level_page.dart';
import 'package:flutter/material.dart';

import '../model/game_utils.dart';

LevelItem level1 = LevelItem(levelNumber: 1, isCompleted: false);
LevelItem level2 = LevelItem(levelNumber: 2, isCompleted: false);
LevelItem level3 = LevelItem(levelNumber: 3, isCompleted: false);
LevelItem level4 = LevelItem(levelNumber: 4, isCompleted: false);
LevelItem level5 = LevelItem(levelNumber: 5, isCompleted: false);
UserItem user = UserItem(score: 0, hp: 3);

class LevelPage extends StatefulWidget {
  const LevelPage({super.key, required this.callback});
  final Function() callback;

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  String bombImage = '';
  int currentIndex = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/background.png'))),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const SettingsPage()),
                                );
                              },
                              child: Image.asset('assets/settings.png')),
                          const SizedBox(
                            width: 30,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const LevelsPage()),
                                );
                              },
                              child: Image.asset('assets/home.png')),
                        ],
                      ),
                      getHearts(),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFFA6D388),
                                Colors.white.withOpacity(0.17)
                              ])),
                      height: 290,
                      width: 433,
                    ),
                    Positioned(
                      top: game.currentLevel == 1
                          ? -5
                          : game.currentLevel == 2
                              ? 10
                              : game.currentLevel == 3
                                  ? -5
                                  : game.currentLevel == 4
                                      ? -5
                                      : 10,
                      child: SizedBox(
                        height: game.currentLevel == 3
                            ? 300
                            : game.currentLevel == 1
                                ? 350
                                : game.currentLevel == 2
                                    ? 400
                                    : game.currentLevel == 4
                                        ? 400
                                        : game.currentLevel == 5
                                            ? 450
                                            : 200,
                        width: game.currentLevel == 3
                            ? 300
                            : game.currentLevel == 1
                                ? 300
                                : game.currentLevel == 2
                                    ? 400
                                    : game.currentLevel == 4
                                        ? 400
                                        : game.currentLevel == 5
                                            ? 450
                                            : 250,
                        child: GridView.builder(
                            itemCount: game.gameImg!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: game.currentLevel == 3
                                        ? 3
                                        : game.currentLevel == 4
                                            ? 4
                                            : game.currentLevel == 1
                                                ? 2
                                                : game.currentLevel == 5
                                                    ? 5
                                                    : 3,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16),
                            padding: const EdgeInsets.all(16.0),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    game.gameImg![index] =
                                        game.cards_list[index];
                                    currentIndex = index;
                                  });
                                  if (game.gameImg![index] ==
                                      "assets/bomb.png") {
                                    bombImage = "assets/bomb.png";
                                    Future.delayed(
                                        const Duration(milliseconds: 2000), () {
                                      if (game.currentLevel ==
                                          level1.levelNumber) {
                                        level1.isCompleted = true;
                                        user.score = user.score! + 15;
                                        user.hp = user.hp! - 1;
                                      } else if (game.currentLevel ==
                                          level2.levelNumber) {
                                        level2.isCompleted = true;
                                        user.score = user.score! + 15;
                                        user.hp = user.hp! - 1;
                                      } else if (game.currentLevel ==
                                          level3.levelNumber) {
                                        level3.isCompleted = true;
                                        user.score = user.score! + 15;
                                        user.hp = user.hp! - 1;
                                      } else if (game.currentLevel ==
                                          level4.levelNumber) {
                                        level4.isCompleted = true;
                                        user.score = user.score! + 15;
                                        user.hp = user.hp! - 1;
                                      } else if (game.currentLevel ==
                                          level5.levelNumber) {
                                        level5.isCompleted = true;
                                        user.score = user.score! + 15;
                                        user.hp = user.hp! - 1;
                                      }
                                      addToSharedP(level1, level2, level3,
                                          level4, level5, user);
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                LvLOverPage(
                                                  callback: () {
                                                    widget.callback();
                                                  },
                                                  currentLevel:
                                                      game.currentLevel!,
                                                )),
                                      );
                                      setState(() {});
                                    });
                                  } else {
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      setState(() {
                                        game.gameImg![index] =
                                            game.hiddenCardpath;
                                        currentIndex = 100;
                                      });
                                    });
                                  }
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                        'assets/hidden_bomb.png',
                                      ))),
                                    ),
                                    game.gameImg![index] == "assets/bomb.png"
                                        ? Positioned(
                                            bottom: game.currentLevel == 1
                                                ? 30
                                                : game.currentLevel == 2
                                                    ? 40
                                                    : 20,
                                            child: Image.asset(
                                              game.gameImg![index],
                                              scale: game.currentLevel == 1
                                                  ? 0.9
                                                  : game.currentLevel == 2
                                                      ? 1.4
                                                      : 1.5,
                                            ),
                                          )
                                        : currentIndex != index
                                            ? Positioned(
                                                right: game.currentLevel == 1
                                                    ? 38
                                                    : game.currentLevel == 2
                                                        ? 30
                                                        : game.currentLevel == 3
                                                            ? 23
                                                            : game.currentLevel ==
                                                                    4
                                                                ? 25
                                                                : game.currentLevel ==
                                                                        5
                                                                    ? 20
                                                                    : 30,
                                                child: Image.asset(
                                                  'assets/question.png',
                                                  scale: game.currentLevel ==
                                                              3 ||
                                                          game.currentLevel ==
                                                              4 ||
                                                          game.currentLevel == 5
                                                      ? 1.5
                                                      : 1.0,
                                                ),
                                              )
                                            : const SizedBox()
                                  ],
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          if (bombImage.isEmpty)
            Positioned(
                bottom: 100, left: 55, child: Image.asset('assets/tiger4.png')),
          if (bombImage.isNotEmpty)
            Positioned(
                bottom: 100, left: 55, child: Image.asset('assets/tiger3.png'))
        ],
      )),
    );
  }
}

Widget getHearts() {
  List<Widget> list = [];
  for (var i = 0; i < user.hp!; i++) {
    list.add(Image.asset('assets/full_heart.png'));
  }
  if (user.hp == 2) {
    list.add(Image.asset('assets/empty_heart.png'));
  }
  if (user.hp == 1) {
    list.add(Image.asset('assets/empty_heart.png'));
    list.add(Image.asset('assets/empty_heart.png'));
  }
  if (user.hp == 0) {
    list.add(Image.asset('assets/empty_heart.png'));
    list.add(Image.asset('assets/empty_heart.png'));
    list.add(Image.asset('assets/empty_heart.png'));
  }
  return Row(
    children: list,
  );
}
