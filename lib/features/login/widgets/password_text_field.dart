import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key, required this.hintText, required this.textEditingController}) : super(key: key);


  final String hintText;
  final TextEditingController? textEditingController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool passwordVisible = false;

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
      child: TextField(
        controller: widget.textEditingController,
        textInputAction: TextInputAction.done,
        style: const TextStyle(color: Colors.white),
        obscureText: !passwordVisible,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.white),
          border: InputBorder.none,
          icon: const Icon(
            Icons.key,
            color: Colors.white,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              passwordVisible ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }
}
