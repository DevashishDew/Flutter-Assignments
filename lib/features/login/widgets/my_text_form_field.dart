import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({Key? key, required this.formValidator}) : super(key: key);

  final String? Function(String? value) formValidator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: formValidator,
      style: const TextStyle(fontSize: 16, color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.key, color: Colors.white),
        suffixIcon: InkWell(
          child: const Icon(Icons.visibility_off, color: Colors.white),
          onTap: () {
            print('show pwd');
            // _showMessage('Show  Pwd');
          },
        ),
        labelText: 'Enter Your Name',
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
