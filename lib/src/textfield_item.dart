import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnChange = void Function(String value);

class TextFieldItem extends StatelessWidget {
  const TextFieldItem({
    required this.controllerList,
    required this.focusNodeList,
    required this.resultList,
    required this.index,
    required this.charCount,
    required this.textfieldCount,
    required this.onChanged,
    required this.border,
    required this.borderRadius,
    required this.fillColor,
    required this.width,
    required this.borderSide,
    required this.hintStyle,
    required this.hintText,
    required this.textStyle,
    super.key,
  });
  final List<TextEditingController> controllerList;
  final List<FocusNode> focusNodeList;
  final List<String> resultList;
  final int index;
  final int charCount;
  final int textfieldCount;
  final OnChange onChanged;
  final double? width;
  final InputBorder? border;
  final Color? fillColor;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final controller = controllerList[index];
    final focusNode = focusNodeList[index];
    return SizedBox(
      width: width ?? (50.0 + (charCount * 10)),
      child: TextField(
        style: textStyle,
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          // LengthLimitingTextInputFormatter(charCount),
        ],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          border: border ??
              OutlineInputBorder(
                borderSide: borderSide?? const BorderSide(),
                borderRadius: borderRadius ?? BorderRadius.circular(4),
              ),
          fillColor: fillColor,
          filled: fillColor != null,
        ),
      ),
    );
  }
}
