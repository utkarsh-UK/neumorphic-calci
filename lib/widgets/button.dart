import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Button extends StatefulWidget {
  final String text;
  final TextStyle style;
  final bool isDigit;
  final Function() onButtonPressed;

  Button({
    @required this.text,
    @required this.style,
    this.isDigit = true,
    this.onButtonPressed,
  }) : assert(text != null && style != null);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Listener(
      onPointerUp: (event) {
        setState(() => _isPressed = false);
        widget.onButtonPressed();
      },
      onPointerDown: (event) => setState(() => _isPressed = true),
      child: Container(
        width: size.width * 0.15,
        height: size.height * 0.1,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: MyColors.bgColor,
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: !_isPressed
                ? [
                    MyColors.bgColor,
                    Color(0xFF443898),
                    Color(0xFF6b60bd),
                  ]
                : [
                    Color(0xFF443898),
                    Color(0xFF443898),
                    MyColors.bgColor,
                  ],
            stops: !_isPressed
                ? [
                    0.1,
                    0.4,
                    1.0,
                  ]
                : [
                    0.1,
                    0.2,
                    1.0,
                  ],
          ),
          boxShadow: [
            BoxShadow(
              color: MyColors.leftShadowColor,
              offset: Offset(-3, -3),
              spreadRadius: 0.6,
              blurRadius: 4.0,
            ),
            BoxShadow(
              color: MyColors.rightShadowColor,
              offset: Offset(4, 4),
              spreadRadius: 0.6,
              blurRadius: 4.0,
            ),
          ],
        ),
        child: FittedBox(
          child: Text(
            widget.text,
            style: widget.style,
          ),
        ),
      ),
    );
  }
}

class ButtonModel {
  final String text;
  final bool isDigit;

  const ButtonModel(this.text, {this.isDigit = true});
}
