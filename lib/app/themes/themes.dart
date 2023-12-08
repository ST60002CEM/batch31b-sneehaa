import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      primarySwatch: Colors.lightGreen,
      scaffoldBackgroundColor: Colors.grey[100],
      fontFamily: "OpenSans Regular",
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Montserrat Bold"),
              backgroundColor: const Color.fromARGB(255, 215, 223, 227),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ))));
}
