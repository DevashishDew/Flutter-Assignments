import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {Key? key, required this.buttonText, required this.backgroundColor, this.icon, required this.onButtonClick})
      : super(key: key);

  final String buttonText;
  final Color backgroundColor;
  final IconData? icon;
  final void Function() onButtonClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      child: TextButton.icon(
        onPressed: onButtonClick,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          backgroundColor: backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        icon: Icon(icon, color: Colors.white,),
        label: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
