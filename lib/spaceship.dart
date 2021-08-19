import 'package:flutter/material.dart';

class Spaceship extends StatefulWidget {
  const Spaceship({Key? key}) : super(key: key);

  @override
  _SpaceshipState createState() => _SpaceshipState();
}

class _SpaceshipState extends State<Spaceship>
    with SingleTickerProviderStateMixin {
  final Image starsBackground =
      Image.asset('assets/stars.png', fit: BoxFit.fill);

  final Image ufo = Image.asset(
    'assets/spaceship.png',
  );

  late AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          child: starsBackground,
          width: double.infinity,
        ),
        AnimatedBuilder(
          animation: _animation,
          builder: (_, __) {
            return Container(
              child: BeamTransition(animation: _animation),
            );
          },
        ),
        Positioned(
          child: Container(
            height: 280,
            child: ufo,
          ),
          top: 10,
        )
      ],
    );
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper oldCliper) => false;
}

class BeamTransition extends AnimatedWidget {
  BeamTransition({
    Key? key,
    required this.animation,
  }) : super(key: key, listenable: animation);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const BeamClipper(),
      child: Container(
        height: 1000,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 1.5,
            colors: [
              Colors.yellow,
              Colors.transparent,
            ],
            stops: [0, animation.value],
          ),
        ),
      ),
    );
  }
}
