import 'package:flutter/material.dart';

class Config {
//  static bool dark = true;
//  static ThemeData themeData = new ThemeData.light();
//
//  static Color fontColor = Colors.white30;
//  static Color searchBackgroundColor = Colors.white10;
//  static Color cardBackgroundColor = new Color(0xFF222222);

  static ThemeData themeData = new ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: new Color(0xFFEBEBEB),
  );
  static Color searchBackgroundColor = new Color(0xFFEBEBEB);
  static Color cardBackgroundColor = Colors.white;
  static Color fontColor = Colors.black54;
  static bool dark = false;
  
  static const SP_COOKIE = "sp_cookie";
}
