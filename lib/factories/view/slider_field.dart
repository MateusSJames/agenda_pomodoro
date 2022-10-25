import 'package:agenda/comum/consts.dart';
import 'package:agenda/factories/view/registration_abstract.dart';
import 'package:flutter/material.dart';

class SliderField extends RegistrationAbstract {
  SliderField({required String? nameField}) : super(nameField: nameField);

  @override
  Widget build() {
    return Slider(
      activeColor: colorAppBar,
      value: 1,
      max: 10,
      divisions: 3,
      onChanged: (value){},
    );
  }

}