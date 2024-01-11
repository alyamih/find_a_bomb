import 'dart:async';
import 'dart:convert';

import 'package:find_a_bomb/model/level_item.dart';
import 'package:find_a_bomb/model/user_item.dart';
import 'package:find_a_bomb/pages/level_page.dart';
import 'package:find_a_bomb/pages/settings_page.dart';
import 'package:find_a_bomb/pages/start_level_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelsPage extends StatefulWidget {
  const LevelsPage({super.key});

  @override
  State<LevelsPage> createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {
  int currentLevel = 0;
  Timer? timer;
  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(minutes: 60),
      (timer) {
        /// callback will be executed every 1 second, increament a count value
        /// on each callback
        if (user.hp! < 3) {
          setState(() {
            user.hp = user.hp! + 1;
          });
        }
      },
    );
    getFromSharedP(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/background.png'))),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset('assets/Group4.png'),
                            Positioned(
                                left: 85,
                                top: 45,
                                child: InkWell(
                                    onTap: () {
                                      if (user.hp != 0) {
                                        currentLevel = 1;
                                        Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  StartLevelPage(
                                                    currentLevel: 1,
                                                    callback: () {
                                                      setState(() {});
                                                    },
                                                  )),
                                        );
                                      } else {
                                        showGameDialog(context);
                                      }
                                    },
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        if (level1.isCompleted == true)
                                          Positioned(
                                              left: -15,
                                              child: Image.asset(
                                                  'assets/boom.png')),
                                        Image.asset('assets/lvl1.png'),
                                      ],
                                    ))),
                            Positioned(
                                left: 220,
                                top: 120,
                                child: InkWell(
                                    onTap: () {
                                      if (user.hp != 0) {
                                        currentLevel = 2;
                                        Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  StartLevelPage(
                                                    currentLevel: 2,
                                                    callback: () {
                                                      setState(() {});
                                                    },
                                                  )),
                                        );
                                      } else {
                                        showGameDialog(context);
                                      }
                                    },
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        if (level2.isCompleted!)
                                          Positioned(
                                              left: -15,
                                              child: Image.asset(
                                                  'assets/boom.png')),
                                        Image.asset('assets/lvl2.png'),
                                      ],
                                    ))),
                            Positioned(
                                left: 320,
                                top: 50,
                                child: InkWell(
                                    onTap: () {
                                      if (user.hp != 0) {
                                        currentLevel = 3;
                                        Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  StartLevelPage(
                                                    currentLevel: 3,
                                                    callback: () {
                                                      setState(() {});
                                                    },
                                                  )),
                                        );
                                      } else {
                                        showGameDialog(context);
                                      }
                                    },
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        if (level3.isCompleted!)
                                          Positioned(
                                              left: -15,
                                              child: Image.asset(
                                                  'assets/boom.png')),
                                        Image.asset('assets/lvl3.png'),
                                      ],
                                    ))),
                            Positioned(
                                left: 430,
                                top: 130,
                                child: InkWell(
                                    onTap: () {
                                      if (user.hp != 0) {
                                        currentLevel = 4;
                                        Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  StartLevelPage(
                                                    currentLevel: 4,
                                                    callback: () {
                                                      setState(() {});
                                                    },
                                                  )),
                                        );
                                      } else {
                                        showGameDialog(context);
                                      }
                                    },
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        if (level4.isCompleted!)
                                          Positioned(
                                              left: -15,
                                              child: Image.asset(
                                                  'assets/boom.png')),
                                        Image.asset('assets/lvl4.png'),
                                      ],
                                    ))),
                            Positioned(
                                left: 580,
                                top: 30,
                                child: InkWell(
                                    onTap: () {
                                      if (user.hp != 0) {
                                        currentLevel = 5;
                                        Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  StartLevelPage(
                                                    currentLevel: 5,
                                                    callback: () {
                                                      setState(() {});
                                                    },
                                                  )),
                                        );
                                      } else {
                                        showGameDialog(context);
                                      }
                                    },
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        if (level5.isCompleted!)
                                          Positioned(
                                              left: -15,
                                              child: Image.asset(
                                                  'assets/boom.png')),
                                        Image.asset('assets/lvl5.png'),
                                      ],
                                    ))),
                          ],
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const SettingsPage()),
                              );
                            },
                            child: Image.asset('assets/settings.png')),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getHearts(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Stack(
                                children: <Widget>[
                                  Text(
                                    'Score: ${user.score}',
                                    style: TextStyle(
                                      fontFamily: 'Trispace',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 6
                                        ..color = const Color(0Xff4E7438),
                                    ),
                                  ),
                                  // Solid text as fill.
                                  Text(
                                    'Score: ${user.score}',
                                    style: const TextStyle(
                                      fontFamily: 'Trispace',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
          Positioned(
              bottom: 25, left: 320, child: Image.asset('assets/tiger6.png'))
        ],
      )),
    );
  }

  void showGameDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              'Not enough HP.',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 17,
              ),
            ),
            content: Text(
              'Please, wait an hour.',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 17,
              ),
            ),
            actions: [
              Card(
                color: Colors.transparent,
                elevation: 0.0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                        child: const Text(
                          'Ok',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}

Future<void> addToSharedP(
    LevelItem? level1,
    LevelItem? level2,
    LevelItem? level3,
    LevelItem? level4,
    LevelItem? level5,
    UserItem? user) async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.clear();
  String rawJson1 = jsonEncode(level1!.toJson());
  prefs.setString('level1', rawJson1);

  String rawJson2 = jsonEncode(level2!.toJson());
  prefs.setString('level2', rawJson2);

  String rawJson3 = jsonEncode(level3!.toJson());
  prefs.setString('level3', rawJson3);

  String rawJson4 = jsonEncode(level4!.toJson());
  prefs.setString('level4', rawJson4);

  String rawJson5 = jsonEncode(level5!.toJson());
  prefs.setString('level5', rawJson5);

  String rawJson6 = jsonEncode(user!.toJson());
  prefs.setString('user', rawJson6);
}

void getFromSharedP(Function() callback) async {
  final prefs = await SharedPreferences.getInstance();
  final rawJson1 = prefs.getString('level1') ?? '';
  final rawJson2 = prefs.getString('level2') ?? '';
  final rawJson3 = prefs.getString('level3') ?? '';
  final rawJson4 = prefs.getString('level4') ?? '';
  final rawJson5 = prefs.getString('level5') ?? '';
  final rawJson6 = prefs.getString('user') ?? '';
  Map<String, dynamic> map1 = {};
  Map<String, dynamic> map2 = {};
  Map<String, dynamic> map3 = {};
  Map<String, dynamic> map4 = {};
  Map<String, dynamic> map5 = {};
  Map<String, dynamic> map6 = {};
  if (rawJson1.isNotEmpty) {
    map1 = jsonDecode(rawJson1);
  }
  if (rawJson2.isNotEmpty) {
    map2 = jsonDecode(rawJson2);
  }
  if (rawJson3.isNotEmpty) {
    map3 = jsonDecode(rawJson3);
  }
  if (rawJson4.isNotEmpty) {
    map4 = jsonDecode(rawJson4);
  }
  if (rawJson5.isNotEmpty) {
    map5 = jsonDecode(rawJson5);
  }
  if (rawJson6.isNotEmpty) {
    map6 = jsonDecode(rawJson6);
  }
  if (map1.isNotEmpty) {
    level1 = LevelItem.fromJson(map1);
  }
  if (map2.isNotEmpty) {
    level2 = LevelItem.fromJson(map2);
  }
  if (map3.isNotEmpty) {
    level3 = LevelItem.fromJson(map3);
  }
  if (map4.isNotEmpty) {
    level4 = LevelItem.fromJson(map4);
  }
  if (map5.isNotEmpty) {
    level5 = LevelItem.fromJson(map5);
  }
  if (map6.isNotEmpty) {
    user = UserItem.fromJson(map6);
  }
  callback();
}
