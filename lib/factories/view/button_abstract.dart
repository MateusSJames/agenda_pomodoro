// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ButtonAbstract {
  String nameButton;
  VoidCallback? onPressed;
  Color? color;
  Color? colorText;

  ButtonAbstract({
    required this.nameButton,
    required this.color,
    required this.colorText,
    required this.onPressed,
  });

  Widget create() {
    return SizedBox(
      width: 170,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color),
        onPressed: onPressed,
        child: Text(
          nameButton,
          style: TextStyle(
            color: colorText,
          ),
        ),
      ),
    );
  }
}
