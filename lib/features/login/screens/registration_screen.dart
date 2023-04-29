import 'package:flutter/material.dart';
import 'package:flutter_assignments/features/login/screens/social_login_screen.dart';
import 'package:flutter_assignments/features/login/widgets/login_button.dart';
import 'package:flutter_assignments/features/login/widgets/login_text_field.dart';
import 'package:flutter_assignments/features/login/widgets/password_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset('assets/images/login-background.jpg').image),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(71, 0, 0, 0),
              Color.fromARGB(226, 0, 0, 0)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
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
              const LoginTextField(
                hintText: 'Email',
                icon: Icons.email,
              ),
              const LoginTextField(
                hintText: 'City',
                icon: Icons.home,
              ),
              const LoginTextField(
                hintText: 'Mobile Number',
                icon: Icons.phone,
              ),
              const LoginTextField(
                hintText: 'Collage',
                icon: Icons.school,
              ),
              const PasswordTextField(),
              const LoginButton(
                buttonText: 'Register',
                backgroundColor: Colors.white,
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
                      builder: (ctx) => SocialLoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Login',
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
      ),
    );
  }
}
