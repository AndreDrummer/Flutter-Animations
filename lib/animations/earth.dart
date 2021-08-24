import 'package:flutter/material.dart';
import 'dart:math' as math;

class Earth extends StatefulWidget {
  @override
  _EarthState createState() => _EarthState();
}

class _EarthState extends State<Earth> {
  bool animate = false;
  double size = 200;
  double radius = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        animate = true;
      });
      for (var i = 0; i < 5; i++) {
        if (!mounted) return;
        setState(() {
          size += i * 5;
          radius = i * 5;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        duration: Duration(seconds: 5),
        tween: Tween<double>(begin: 0, end: 2 * math.pi),
        builder: (_, double angle, __) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Transform.rotate(
              angle: angle,
              child: Image.asset('assets/earth.png'),
            ),
          );
        },
      ),
    );
  }
}
