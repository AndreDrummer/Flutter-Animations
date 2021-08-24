import 'package:animate/animations/earth.dart';
import 'package:animate/animations/galaxy.dart';
import 'package:animate/animations/red_square.dart';
import 'package:animate/animations/spaceship.dart';
import 'package:animate/animations/sun.dart';
import 'package:animate/animations/text_animate.dart';
import 'package:flutter/material.dart';

import 'animations/fade_in_animation.dart';
import 'animations/flutter_logo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Animations Implicity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final buttonTitles = [
      'Red Square',
      'Earth',
      'Sun',
      'Galaxy',
      'Spaceship',
      'Text',
      'Fade In Animation',
      'Logo App'
    ];

    Widget _getView(int index) {
      switch (index) {
        case 0:
          return RedSquare();
        case 1:
          return Earth();
        case 2:
          return Sun();
        case 3:
          return Galaxy();
        case 4:
          return Spaceship();
        case 5:
          return AnimatedText();
        case 6:
          return FadeInAnimation();
        default:
          return LogoApp();
      }
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 400,
            child: _getView(index),
          ),
          Expanded(
            // height: 12,
            child: GridView(
              padding: EdgeInsets.zero,
              // physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              children: buttonTitles
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            index = buttonTitles.indexOf(e);
                          });
                        },
                        child: Text(e),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
