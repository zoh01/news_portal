import 'package:flutter/material.dart';

class ZohOutlinedButtonTheme {
  ZohOutlinedButtonTheme._();
  ///Light theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        side: const BorderSide(color: Colors.blue),
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        textStyle: const TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))
    ),
  );

  ///Dark theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        side: const BorderSide(color: Colors.blue),
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        textStyle: const TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))
    ),
  );
}