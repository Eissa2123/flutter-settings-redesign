import 'package:flutter/material.dart';
import 'package:flutter_settings_redesign/core/constants.dart';

class AppTheme {
  //== Light Theme ==//
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    //== For Background ==//
    scaffoldBackgroundColor: Constants.backgroundColor,
    //== For Cards or Container ==//
    cardColor: Constants.cardColor,
    colorScheme: const ColorScheme.light(
      //== For Switch ==//
      primary: Colors.green,
      //== For Text ==//
      onSurface: Colors.black87,
      //== For Outline ==//
      outline: Color(0xFFE0E0E0),
      //== For Icon ==//
      secondary: Colors.grey,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Constants.textColor),
    ),
  );

  //== Dark Theme ==//
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    //== For Background ==//
    scaffoldBackgroundColor: const Color(0xFF101010),
    //== For Cards or Container ==//
    cardColor: const Color.fromARGB(255, 27, 27, 27),
    //== For Switch ==//
    colorScheme: const ColorScheme.dark(
      primary: Colors.greenAccent,
      //== For Text ==//
      onSurface: Colors.white,
      //== For outline ==//
      outline: Color.fromARGB(255, 37, 37, 37),
      //== For Icon ==//
      secondary: Colors.grey,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );
}
