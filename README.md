# separated_textfield

This is a Widget to create textfield separated with custom widgets.
Usecase : Credit/Debit card number, Pin Code, OTP

**Screenshots**

![Simulator Screenshot - iPhone SE (3rd generation) - 2023-07-06 at 00 24 41](https://github.com/vinay416/textfield-separator/assets/70840787/5e345acd-2702-4bdf-844d-cb6be5ca5c85)

![Simulator Screenshot - iPhone SE (3rd generation) - 2023-07-06 at 00 24 47](https://github.com/vinay416/textfield-separator/assets/70840787/e4869b2f-7024-4b82-b265-3503b2a0abb4)

![Simulator Screenshot - iPhone SE (3rd generation) - 2023-07-06 at 00 25 01](https://github.com/vinay416/textfield-separator/assets/70840787/54329f4c-9a43-4291-a09e-dfc93a5008d1)

**Example:** textfield-separator/example/example.dart

**Use of the Widget**

````
SeparatedTextField(
            charCount: 1,  // define char count want in a textfield
            textfieldCount: 3, // define count of textfield
            onSubmit: (value) {  // callback for result value
              debugPrint(value);
            },
          ),
````



**All properties of the widget**

````
const SeparatedTextField({
    this.charCount = 1,   // define char count want in a textfield (default: 1)
    required this.textfieldCount,   // define count of textfield
    required this.onSubmit,  // callback for result value
    this.border,  // textField border style (default: Oultine Boder)
    this.borderRadius,  // BoderRadius of Oultine Boder (default: 4)
    this.fillColor,  // textField fillColor (null: default)
    this.width,  // width of each Textfield (default: (50.0 + (charCount * 10) )
    this.borderSide, // BoderSide of the textfield (default: material)
    this.textFieldSeparator, // provide 'Widget' for spacing between textfield (default: SizedBox(width: 20) )
    super.key, // key for widget
  });

````
