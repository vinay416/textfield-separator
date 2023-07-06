library separated_textfield;

import 'package:flutter/material.dart';
import 'package:separated_textfield/src/textfield_builder.dart';

class SeparatedTextField extends StatelessWidget {
  const SeparatedTextField({
    this.charCount = 1,
    required this.textfieldCount,
    required this.onSubmit,
    this.border,
    this.borderRadius,
    this.fillColor,
    this.width,
    this.borderSide,
    this.textFieldSeparator,
    this.hintStyle,
    this.hintText,
    this.textStyle,
    super.key,
  });

  final int charCount;
  final int textfieldCount;
  final OnSubmit onSubmit;
  final double? width;
  final InputBorder? border;
  final Color? fillColor;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final Widget? textFieldSeparator;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextFieldBuilder(
      charCount: charCount,
      textfieldCount: textfieldCount,
      border: border,
      borderRadius: borderRadius,
      borderSide: borderSide,
      fillColor: fillColor,
      width: width,
      textFieldSeparator: textFieldSeparator,
      onSubmit: onSubmit,
      hintStyle: hintStyle,
      hintText: hintText,
      textStyle: textStyle,
    );
  }
}
