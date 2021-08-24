import 'package:flutter/material.dart';
import 'dart:math' as math;

class RedSquare extends StatefulWidget {
  @override
  _RedSquareState createState() => _RedSquareState();
}

class _RedSquareState extends State<RedSquare> {
  bool animate = false;
  double size = 100;
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
        setState(() {
          size += i * 15;
          radius = i * 5;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Colors.red,
        ),
        duration: Duration(seconds: 2),
        transform: Matrix4.identity()
          ..translate(size / 2, size / 2)
          ..multiply(Matrix4.rotationZ(animate ? math.pi / 4 : 0))
          ..translate(-size / 2, -size / 2),
        height: size,
        width: size,
      ),
    );
  }
}
