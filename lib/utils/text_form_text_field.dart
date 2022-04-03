import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class TextFormTextField extends StatelessWidget {
  const TextFormTextField(
      {Key? key,
      required this.label,
      required this.controller,
      required this.inputType})
      : super(key: key);

  final String label;
  final TextEditingController controller;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your $label";
        }

        if (inputType == TextInputType.name) {
          if (!RegExp('[a-zA-Z]').hasMatch(value)) {
            return "Enter a valid $label";
          } else {
            return null;
          }
        }

        if (inputType == TextInputType.emailAddress) {
          if (!EmailValidator.validate(value.trim())) {
            return "Enter a valid $label";
          } else {
            return null;
          }
        }

        if (inputType == TextInputType.visiblePassword) {
          if (!EmailValidator.validate(value.trim())) {
            return "Enter a valid $label";
          } else {
            return null;
          }
        }

        return null;
      },
      keyboardType: inputType,
      controller: controller,
      decoration: InputDecoration(
          labelStyle: const TextStyle(
              color: primaryAppColor, fontWeight: FontWeight.w600),
          labelText: label,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: primaryAppColor, width: 2.0),
              borderRadius: BorderRadius.circular(25.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: primaryAppColor, width: 2.0),
              borderRadius: BorderRadius.circular(25.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: accentAppColor, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          )),
    );
  }
}
