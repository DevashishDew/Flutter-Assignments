import 'package:flutter/material.dart';
import 'package:flutter_assignments/features/login/screens/registration_screen.dart';
import 'package:flutter_assignments/features/login/widgets/login_page_background.dart';
import 'package:flutter_assignments/features/login/widgets/social_login_button.dart';

class SocialLoginScreen extends StatelessWidget {
  const SocialLoginScreen({Key? key}) : super(key: key);

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
            SocialLoginButton(
              buttonText: 'Google',
              buttonColor: Colors.white,
              textColor: Colors.black,
              icon: 'assets/images/ic_google.png',
              onButtonClick: () {},
            ),
            SocialLoginButton(
              buttonText: 'Facebook',
              buttonColor: Colors.blue,
              textColor: Colors.white,
              icon: 'assets/images/ic_facebook.png',
              onButtonClick: () {},
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
