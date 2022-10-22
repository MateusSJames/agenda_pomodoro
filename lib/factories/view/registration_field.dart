import 'package:agenda/factories/view/registration_abstract.dart';
import 'package:flutter/material.dart';

class RegistrationField extends RegistrationAbstract{
  RegistrationField({
    required String? nameField,
  }) : super(nameField: nameField);

  @override
  Widget build() {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        isDense: true,
      ),
    );
  }

}