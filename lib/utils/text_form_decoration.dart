import 'package:flutter/material.dart';

import '../app_colors.dart';

class TextFormDecoration extends InputDecoration {
  const TextFormDecoration({required this.labelString});

  final String labelString;
  @override
  String? get labelText => labelString;

  @override
  TextStyle? get labelStyle =>
      const TextStyle(color: primaryAppColor, fontWeight: FontWeight.w600);

  @override
  Color? get fillColor => Colors.white;

  @override
  InputBorder? get border => OutlineInputBorder(
      borderSide: const BorderSide(color: primaryAppColor, width: 1.0),
      borderRadius: BorderRadius.circular(12.0));

  @override
  InputBorder? get enabledBorder => OutlineInputBorder(
      borderSide: const BorderSide(color: primaryAppColor, width: 1.0),
      borderRadius: BorderRadius.circular(12.0));

  @override
  InputBorder? get focusedBorder => OutlineInputBorder(
      borderSide: const BorderSide(color: accentAppColor, width: 1.0),
      borderRadius: BorderRadius.circular(12.0));
}
