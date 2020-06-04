import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final TextStyle style;

  Button({
    @required this.text,
    @required this.style,
  }) : assert(text != null && style != null);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => print('Clicked'),
      child: Container(
        width: size.width * 0.15,
        height: size.height * 0.1,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: MyColors.bgColor,
          borderRadius: BorderRadius.circular(10.0),
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
            text,
            style: style,
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
