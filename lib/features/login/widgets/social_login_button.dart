import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {Key? key,
      required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      required this.icon,
      required this.onButtonClick})
      : super(key: key);

  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final String icon;
  final void Function() onButtonClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          backgroundColor: buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(icon),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
