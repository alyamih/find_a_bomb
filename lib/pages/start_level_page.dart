import 'package:find_a_bomb/model/game_utils.dart';
import 'package:find_a_bomb/pages/level_page.dart';
import 'package:find_a_bomb/pages/levels_page.dart';
import 'package:find_a_bomb/pages/settings_page.dart';
import 'package:flutter/material.dart';

Game game = Game();

class StartLevelPage extends StatelessWidget {
  const StartLevelPage(
      {super.key, required this.currentLevel, required this.callback});
  final int currentLevel;
  final Function() callback;

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
            child: Column(children: [
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
                    getHearts()
                  ],
                ),
              ),
              Container(
                height: 300,
                width: 433,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFFA6D388),
                          Colors.white.withOpacity(0.17)
                        ])),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 5),
                        child: Stack(
                          children: <Widget>[
                            Text(
                              'Level $currentLevel',
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
                              'Level $currentLevel',
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
                      Stack(
                        children: <Widget>[
                          Text(
                            'Find a Bomb',
                            style: TextStyle(
                              fontFamily: 'Trispace',
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color = const Color(0Xff4E7438),
                            ),
                          ),
                          // Solid text as fill.
                          const Text(
                            'Find a Bomb',
                            style: TextStyle(
                              fontFamily: 'Trispace',
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            game.currentLevel = currentLevel;
                            game.initCardsList();
                            game.initGame();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) => LevelPage(
                                        callback: () {
                                          callback();
                                        },
                                      )),
                            );
                          },
                          child: Image.asset('assets/start_game.png'))
                    ]),
              )
            ]),
          ),
          Positioned(
              bottom: 100, left: 55, child: Image.asset('assets/tiger4.png'))
        ],
      )),
    );
  }
}
