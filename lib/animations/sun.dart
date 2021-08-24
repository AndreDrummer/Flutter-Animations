import 'package:flutter/material.dart';

class Sun extends StatefulWidget {
  @override
  _SunState createState() => _SunState();
}

class _SunState extends State<Sun> {
  double size = 200;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      for (var i = 0; i < 5; i++) {
        if (!mounted) return;
        setState(() {
          size += i * 22;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
        ),
        Center(
          child: TweenAnimationBuilder(
            tween: ColorTween(begin: Colors.white, end: Colors.orange),
            duration: Duration(seconds: 3),
            child: Image.asset(
              'assets/sun.png',
              fit: BoxFit.cover,
            ),
            builder: (_, color, child) {
              return AnimatedContainer(
                duration: Duration(seconds: 1),
                width: size,
                height: size,
                child: ColorFiltered(
                  child: child,
                  colorFilter:
                      ColorFilter.mode(color as Color, BlendMode.modulate),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
