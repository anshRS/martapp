// Defines the named routes used for navigation.
import 'package:client/screens/screens.dart';
import 'package:flutter/material.dart';

class RouteManager {
  // Route Names
  static const String signupScreen = '/signupScreen';
  static const String loginScreen = '/loginScreen';
  static const String homeScreen = '/homeScreen';

  // Control our screen route flow
  static Route<dynamic> routeController(RouteSettings settings) {
    switch (settings.name) {
      case signupScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignUpScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
      case homeScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('ERROR 404!!'),
            ),
          ),
        );
    }
  }
}
