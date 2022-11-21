import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback function;
  const GeneralButton({
    Key? key,
    required this.buttonText,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Text(buttonText),
    );
  }
}
