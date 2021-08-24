import 'package:flutter/material.dart';

class Galaxy extends StatefulWidget {
  @override
  _GalaxyState createState() => _GalaxyState();
}

class _GalaxyState extends State<Galaxy> with SingleTickerProviderStateMixin {
  bool animate = false;
  double size = 200;
  double radius = 0;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 15),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          color: Colors.black,
          child: RotationTransition(
            child: Container(
              child: Image.asset('assets/galaxy.png'),
              height: 300,
            ),
            alignment: Alignment.center,
            turns: _animationController,
          ),
        ),
        Positioned(
          top: 420,
          left: 150,
          child: TextButton(
            onPressed: () {
              setState(() {
                if (_animationController.isAnimating) {
                  _animationController.stop();
                } else {
                  _animationController.repeat();
                }
              });
            },
            child: Text(
              _animationController.isAnimating ? 'STOP' : 'START',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
