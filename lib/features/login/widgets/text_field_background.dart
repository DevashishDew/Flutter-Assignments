import 'package:flutter/material.dart';

class TextFieldBackground extends StatelessWidget {
  const TextFieldBackground({Key? key, required this.textField}) : super(key: key);

  final TextField textField;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.white)),
      child: textField,
    );
  }
}
