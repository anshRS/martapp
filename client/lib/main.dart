import 'package:client/routes/routes.dart';
import 'package:client/screens/screens.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MartApp',
      theme: ThemeData(
        scaffoldBackgroundColor: UtilityClass.primarybackgroundColor,
        colorScheme: const ColorScheme.light(
          primary: UtilityClass.primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: (settings) => RouteManager.routeController(settings),
      home: const SignUpScreen(),
    );
  }
}
