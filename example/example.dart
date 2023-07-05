import 'package:flutter/material.dart';
import 'package:separated_textfield/separated_textfield.dart';

void main() {
  runApp(const Example());
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Example'),
        ),
        body: Center(
          child: SeparatedTextField(
            charCount: 1,
            textfieldCount: 3,
            onSubmit: (value) {
              debugPrint(value);
            },
          ), //added package widget
        ),
      ),
    );
  }
}
