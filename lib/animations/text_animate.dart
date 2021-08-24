import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({Key? key}) : super(key: key);

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  var backgroundColor = Colors.black;
  var textColor = Colors.white;
  var fontSize = 20.0;
  var bottom = 0.0;
  var secondState = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor,
          duration: Duration(seconds: 1),
          alignment: Alignment.center,
          child: AnimatedDefaultTextStyle(
            duration: Duration(seconds: 1),
            child: Text(
              'Hello, World!',
            ),
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(seconds: 1),
          bottom: bottom,
          left: 0,
          right: 0,
          child: ElevatedButton(
            child: Text('PRESS ME'),
            onPressed: () {
              setState(() {
                if (secondState) {
                  backgroundColor = Colors.black;
                  textColor = Colors.white;
                  fontSize = 20.0;
                  bottom = 0.0;
                  secondState = !secondState;
                } else {
                  backgroundColor = Colors.white;
                  textColor = Colors.black;
                  fontSize = 40;
                  bottom = 335;
                  secondState = !secondState;
                }
              });
            },
          ),
        )
      ],
    );
  }
}
