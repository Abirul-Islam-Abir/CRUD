import 'package:flutter/material.dart';

ThemeData mainTheme() {
  return ThemeData(
    appBarTheme: globalAppBarTheme(),
    elevatedButtonTheme: globalElevatedButtonStyle(),
    inputDecorationTheme: globalInputDecorationTheme(),
  );
}

InputDecorationTheme globalInputDecorationTheme() {
  return InputDecorationTheme(
    border: const OutlineInputBorder(),
    fillColor: Colors.grey.shade300,
    filled: true,
  );
}

ElevatedButtonThemeData globalElevatedButtonStyle() {
  return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shadowColor: Colors.black,
          padding: const EdgeInsets.all(16)));
}

AppBarTheme globalAppBarTheme() =>
    AppBarTheme(elevation: 10, backgroundColor: Colors.orange.shade300);
