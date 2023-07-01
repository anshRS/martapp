import 'package:flutter/material.dart';

class UtilityClass {

  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 58, 123, 213),
      Color.fromARGB(255, 0, 210, 255),
    ],
    stops: [0.5, 1.0],
  );

  // Colors
  static const primaryColor = Color(0xff0984e3);
  static const primarybackgroundColor = Color(0xfff5f6fa);
  static const Color secondarybackgroundColor = Color(0xffebecee);  
  static var selectedNavBarColor = Color(0xff222f3e);
  static const unselectedNavBarColor = Colors.black87;
}
