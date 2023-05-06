import 'package:flutter/material.dart';
import 'package:flutter_assignments/Navigation/route_constants.dart';
import 'package:flutter_assignments/features/login/constants.dart';
import 'package:flutter_assignments/features/login/screens/registration_screen.dart';
import 'package:flutter_assignments/features/login/widgets/login_button.dart';
import 'package:flutter_assignments/features/login/widgets/login_page_background.dart';
import 'package:flutter_assignments/features/login/widgets/password_text_field.dart';
import 'package:flutter_assignments/features/login/widgets/text_field_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void validateAndSubmitDetails() {
    final bool emailValid = emailRegex
        .hasMatch(_emailController.text);

    if (!emailValid) {
      _showMessage('Enter valid email!');
      return;
    }
    if (_passwordController.text.length < 5) {
      _showMessage('Enter valid password');
      return;
    }

    _showMessage('Logged In successfully');
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPageBackground(
        childWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Join Mr Bookworm!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFieldBackground(
              textField: TextField(
                controller: _emailController,
                textInputAction: TextInputAction.next,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            PasswordTextField(
              hintText: 'Password',
              textEditingController: _passwordController,
            ),
            LoginButton(
              buttonText: 'Login',
              backgroundColor: Colors.white,
              onButtonClick: validateAndSubmitDetails,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Don\'t have an account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, registerRoute, arguments: 'Data from login'),
              child: const Text(
                'Create Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
