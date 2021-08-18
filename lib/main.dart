import 'package:animate/earth.dart';
import 'package:animate/galaxy.dart';
import 'package:animate/red_square.dart';
import 'package:animate/sun.dart';
import 'package:flutter/material.dart';

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
    final screensTitle = [
      'Red Square',
      'Earth',
      'Sun',
      'Galaxy',
    ];

    Widget _getView(int index) {
      switch (index) {
        case 0:
          return RedSquare();
        case 1:
          return Earth();
        case 2:
          return Sun();
        default:
          return Galaxy();
      }
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 460,
            child: _getView(index),
          ),
          Container(
            height: 132,
            child: GridView(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              children: screensTitle
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            index = screensTitle.indexOf(e);
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
