import 'package:flutter/material.dart';

class ThemeApp {
  
  static ThemeData darkTheme(){
    final theme = ThemeData.dark().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark, 
        primary: Colors.grey, 
        onPrimary: Colors.amber, 
        secondary: Colors.black12, 
        onSecondary: Colors.redAccent, 
        error: Colors.red, 
        onError: Colors.red, 
        surface: Colors.orange, 
        onSurface: Colors.black
      )
    );
    return theme;
  }

  static ThemeData lightTheme(){
    final theme = ThemeData.light().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.light, 
        primary: Colors.white, 
        onPrimary: Colors.purple, 
        secondary: Colors.grey, 
        onSecondary: Colors.red, 
        error: Colors.red, 
        onError: Colors.red, 
        surface: Colors.blueAccent, 
        onSurface: Colors.black
      )
    );
    return theme;
  }


}