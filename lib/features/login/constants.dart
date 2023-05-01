import 'package:flutter/material.dart';

const kMinPasswordLength = 5;

RegExp emailRegex = RegExp(r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");

const textFormFieldDecoration = InputDecoration(
  prefixIcon: Icon(Icons.key, color: Colors.white),
  // suffixIcon: InkWell(
  //   child: Icon(Icons.visibility_off, color: Colors.white),
  //   onTap: (){
  //     _showMessage('Show  Pwd');
  //   },
  // ),
  labelText: 'Enter Your Name',
  labelStyle: TextStyle(color: Colors.white),
  floatingLabelStyle: TextStyle(fontSize: 16, color: Colors.white),
  hintStyle: TextStyle(color: Colors.white),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(40)),
    borderSide: BorderSide(color: Colors.white, width: 1),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(40)),
    borderSide: BorderSide(color: Colors.white, width: 1),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(40)),
    borderSide: BorderSide(color: Colors.red, width: 1),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(40)),
    borderSide: BorderSide(color: Colors.red, width: 1),
  ),
);
