import 'package:flutter/material.dart';
import 'package:separated_textfield/src/textfield_item.dart';

typedef OnSubmit = void Function(String value);

class TextFieldBuilder extends StatefulWidget {
  const TextFieldBuilder({
    required this.textfieldCount,
    required this.onSubmit,
    required this.charCount,
    required this.border,
    required this.borderRadius,
    required this.fillColor,
    required this.width,
    required this.borderSide,
    required this.textFieldSeparator,
    required this.hintStyle,
    required this.hintText,
    required this.textStyle,
    super.key,
  });
  final int textfieldCount;
  final OnSubmit onSubmit;
  final int charCount;
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
  State<TextFieldBuilder> createState() => _TextFieldBuilderState();
}

class _TextFieldBuilderState extends State<TextFieldBuilder> {
  late List<TextEditingController> controllerList;
  late List<FocusNode> focusNodeList;
  late List<String> resultList;

  @override
  void initState() {
    generateLists();
    super.initState();
  }

  void generateLists() {
    focusNodeList = List.generate(
      widget.textfieldCount,
      (index) => FocusNode(debugLabel: 'Foucus Node index $index'),
    );
    controllerList = List.generate(
      widget.textfieldCount,
      (index) => TextEditingController(),
    );
    resultList = List.generate(widget.textfieldCount, (index) => '');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.textfieldCount,
        (index) {
          return Row(
            children: [
              TextFieldItem(
                controllerList: controllerList,
                focusNodeList: focusNodeList,
                resultList: resultList,
                index: index,
                textfieldCount: widget.textfieldCount,
                charCount: widget.charCount,
                width: widget.width,
                border: widget.border,
                borderRadius: widget.borderRadius,
                fillColor: widget.fillColor,
                borderSide: widget.borderSide,
                hintStyle: widget.hintStyle,
                hintText: widget.hintText,
                textStyle: widget.textStyle,
                onChanged: (value) {
                  setValueToTextField(value, index);
                },
              ),
              if (index < widget.textfieldCount - 1)
                widget.textFieldSeparator ?? const SizedBox(width: 20),
            ],
          );
        },
      ),
    );
  }

  setValueToTextField(String value, int index) {
    if (value.length <= widget.charCount) {
      // set result array till charCount length
      resultList[index] = value;
      // change focus to previous textfield
      changeFocusToPreviousNodeWhenValueIsRemoved(
        value: value,
        indexOfTextField: index,
      );
    } else if (value.length > widget.charCount) {
      // set the previous textfield text by substring
      final newValue = value.substring(0, widget.charCount);
      final controller = controllerList[index];
      controller.text = newValue;
      controller.selection = TextSelection.collapsed(
        offset: controller.text.length,
      );
      // if not the last textfield
      // set value to the next Textfield
      if (index + 1 < widget.textfieldCount) {
        final newValue = value.substring(widget.charCount);
        final nextController = controllerList[index + 1];
        nextController.text = newValue;
        nextController.selection = TextSelection.collapsed(
          offset: nextController.text.length,
        );
        resultList[index + 1] = newValue;
      }
      // set focus to next textfield
      changeFocusToNextNodeWhenValueIsEntered(
        value: value,
        indexOfTextField: index,
      );
    }
    // callback of the result data
    onSubmit();
  }

  void onSubmit() {
    final result = resultList.join().trim();
    widget.onSubmit(result);
  }

  void changeFocusToNextNodeWhenValueIsEntered({
    required String value,
    required int indexOfTextField,
  }) {
    // return func if textfield is empty
    if (value.length < widget.charCount) {
      return;
    }
    //if the textField in focus is not the last textField,
    if (indexOfTextField + 1 != widget.textfieldCount) {
      //change focus to the next textField
      final focusNode = focusNodeList[indexOfTextField + 1];
      FocusScope.of(context).requestFocus(focusNode);
    } else {
      //if the last textField, unFocus after text changed
      focusNodeList[indexOfTextField].unfocus();
    }
  }

  void changeFocusToPreviousNodeWhenValueIsRemoved({
    required String value,
    required int indexOfTextField,
  }) {
    // return textfield have length
    if (value.isNotEmpty) {
      return;
    }
    //if the textField in focus is not the first textField,
    // change focus to the previous textField
    if (indexOfTextField != 0) {
      //change focus to the next textField
      final focusNode = focusNodeList[indexOfTextField - 1];
      FocusScope.of(context).requestFocus(focusNode);
    }
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  void disposeControllers() {
    for (var element in controllerList) {
      element.dispose();
    }
    for (var element in focusNodeList) {
      element.dispose();
    }
    resultList.clear();
  }
}
