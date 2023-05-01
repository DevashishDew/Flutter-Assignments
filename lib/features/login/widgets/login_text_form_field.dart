import 'package:flutter/material.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField(
      {Key? key,
      required this.labelText,
      required this.iconData,
      required this.formValidator})
      : super(key: key);

  final IconData iconData;
  final String labelText;
  final String? Function(String? value) formValidator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: formValidator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(fontSize: 16, color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        prefixIcon:  Icon(iconData, color: Colors.white),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        floatingLabelStyle: const TextStyle(fontSize: 16, color: Colors.white),
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
      ),
    );
  }
}
