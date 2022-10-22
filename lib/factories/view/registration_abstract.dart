import 'package:flutter/material.dart';

abstract class RegistrationAbstract {
  String? nameField;

  RegistrationAbstract({
    required this.nameField,
  });

  Widget create() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                nameField!,
                style: const TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          build(),
        ],
      ),
    );
  }
  Widget build();
}