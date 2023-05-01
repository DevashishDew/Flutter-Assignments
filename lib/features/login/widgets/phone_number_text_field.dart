import 'package:flutter/material.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({Key? key, required this.textEditingController}) : super(key: key);


  final TextEditingController? textEditingController;

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
        controller: textEditingController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          hintText: 'Mobile Number',
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          icon: Icon(
            Icons.phone,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
