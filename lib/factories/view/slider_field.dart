import 'package:agenda/comum/consts.dart';
import 'package:agenda/factories/view/registration_abstract.dart';
import 'package:flutter/material.dart';

class SliderField extends RegistrationAbstract {
  double? valueStore;
  double? min;
  double? max;
  int? divisions;
  void Function(double)? onChanged;
  SliderField({
    required this.valueStore,
    required this.min,
    required this.max,
    required this.divisions,
    required String? nameField,
    required this.onChanged,
  }) : super(nameField: nameField);

  @override
  Widget build() {
    return Slider(
      activeColor: colorAppBar,
      value: valueStore!,
      min: min!,
      max: max!,
      label: valueStore!.round().toString(),
      divisions: divisions,
      onChanged: onChanged,
    );
  }
}
