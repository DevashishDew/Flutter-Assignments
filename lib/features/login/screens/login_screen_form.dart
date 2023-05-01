import 'package:flutter/material.dart';
import 'package:flutter_assignments/features/login/screens/registration_screen.dart';
import 'package:flutter_assignments/features/login/widgets/login_button.dart';
import 'package:flutter_assignments/features/login/widgets/login_page_background.dart';
import 'package:flutter_assignments/features/login/widgets/login_text_form_field.dart';
import 'package:flutter_assignments/features/login/widgets/my_text_form_field.dart';

class LoginScreenForm extends StatefulWidget {
  const LoginScreenForm({Key? key}) : super(key: key);

  @override
  State<LoginScreenForm> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _showMessage('Logged In');
    }
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
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    LoginTextFormField(
                      labelText: 'Email',
                      iconData: Icons.email,
                      formValidator: (value) {
                        if (value != null && value.trim().length < 4) {
                          return 'This field requires a minimum of 4 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16,),
                    PasswordTextFormField(
                      formValidator: (value) {
                        if (value != null && value.trim().length < 4) {
                          return 'This field requires a minimum of 6 characters';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            LoginButton(
              buttonText: 'Register',
              backgroundColor: Colors.white,
              onButtonClick: _saveForm,
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
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const RegisterScreen(),
                  ),
                );
              },
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
