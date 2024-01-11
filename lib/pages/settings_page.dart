import 'package:find_a_bomb/pages/level_page.dart';
import 'package:find_a_bomb/pages/levels_page.dart';
import 'package:find_a_bomb/pages/show_screen.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/background.png'))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const LevelsPage()),
                        );
                      },
                      child: Image.asset('assets/home.png')),
                  getHearts()
                ],
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomRight,
              children: [
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 11),
                        child: Stack(
                          children: <Widget>[
                            Text(
                              'Settings',
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
                              'Settings',
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
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const ReadTermsOrPrivacyScreenView(
                                      link: 'google.com',
                                    )),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'Privacy Policy',
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
                                'Privacy Policy',
                                style: TextStyle(
                                  fontFamily: 'Trispace',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const ReadTermsOrPrivacyScreenView(
                                      link: 'google.com',
                                    )),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'Terms Of Use',
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
                                'Terms Of Use',
                                style: TextStyle(
                                  fontFamily: 'Trispace',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Stack(
                          children: <Widget>[
                            Text(
                              'Rate App',
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
                              'Rate App',
                              style: TextStyle(
                                fontFamily: 'Trispace',
                                fontWeight: FontWeight.w700,
                                fontSize: 32,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
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
                    ],
                  ),
                ),
                Positioned(
                    right: -150,
                    bottom: -35,
                    child: Image.asset('assets/tiger5.png'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
