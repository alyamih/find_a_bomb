import 'package:find_a_bomb/pages/level_page.dart';
import 'package:find_a_bomb/pages/levels_page.dart';
import 'package:find_a_bomb/pages/settings_page.dart';
import 'package:flutter/material.dart';

class LvLOverPage extends StatelessWidget {
  const LvLOverPage(
      {super.key, required this.currentLevel, required this.callback});
  final int currentLevel;
  final Function() callback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/background.png'))),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            height: 290,
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
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/over_boom.png',
                  scale: 1.5,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: Stack(
                        children: <Widget>[
                          Text(
                            'Level $currentLevel is over!',
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
                          Text(
                            'Level $currentLevel is over!',
                            style: const TextStyle(
                              fontFamily: 'Trispace',
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Stack(
                        children: <Widget>[
                          Text(
                            'Score',
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
                          const Text(
                            'Score',
                            style: TextStyle(
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
                          '15',
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
                        const Text(
                          '15',
                          style: TextStyle(
                            fontFamily: 'Trispace',
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        callback();
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute<void>(
                        //       builder: (BuildContext context) =>
                        //           const LevelsPage()),
                        // );
                      },
                      child: Image.asset(
                        'assets/next.png',
                        scale: 1.5,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
