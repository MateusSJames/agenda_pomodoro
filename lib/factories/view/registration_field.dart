import 'package:agenda/factories/view/registration_abstract.dart';
import 'package:flutter/material.dart';

class RegistrationField extends RegistrationAbstract {
  IconButton? iconButton;
  TextEditingController? controller;
  bool? enable;
  GestureTapCallback? onTap;
  void Function(String)? onChanged;
  RegistrationField({
    required String? nameField,
    this.controller,
    this.iconButton,
    this.enable,
    this.onTap,
    this.onChanged,
  }) : super(nameField: nameField);

  @override
  Widget build() {
    return GestureDetector(
      onTap: onTap,
      child: TextField(
        enabled: enable,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          isDense: true,
          suffixIcon: iconButton,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
