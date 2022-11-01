import 'package:flutter/material.dart';

class ButtonAbstract {
  String nameButton;
  VoidCallback? onPressed;
  Color? color;

  ButtonAbstract({
    required this.nameButton,
    required this.color,
    required this.onPressed,
  });

  Widget create() {
    return SizedBox(
      width: 170,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: onPressed,
        child: Text(nameButton),
      ),
    );
  }
}
