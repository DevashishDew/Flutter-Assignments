import 'package:flutter/material.dart';
import 'package:flutter_assignments/Navigation/route_constants.dart';
import 'package:flutter_assignments/features/login/screens/login_screen.dart';
import 'package:flutter_assignments/features/login/screens/login_screen_form.dart';
import 'package:flutter_assignments/features/login/screens/registration_screen.dart';
import 'package:flutter_assignments/features/login/screens/social_login_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case socialLoginRoute:
        return MaterialPageRoute(builder: (_) => const SocialLoginScreen());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}