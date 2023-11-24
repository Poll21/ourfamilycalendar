import 'package:flutter/material.dart';

final kDarkTheme = ThemeData().copyWith(
  appBarTheme: AppBarTheme(color: Colors.black),
  scaffoldBackgroundColor: const Color(0xDAE0E2E7),
  focusColor: Colors.pink,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shadowColor: Color(0xFFD5D5D7FF),
          textStyle: TextStyle(),
          backgroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ))),
  textSelectionTheme: TextSelectionThemeData(

      cursorColor: Colors.black,
      selectionColor: Colors.black,
      selectionHandleColor: Colors.black),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      gapPadding: 50,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 1, color: Colors.black26),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 2, color: Colors.black26),
    ),
    errorBorder: OutlineInputBorder(
      gapPadding: 50,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 2, color: Colors.red),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 2, color: Colors.black),
    ),
    focusedErrorBorder: OutlineInputBorder(
      gapPadding: 50,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 3, color: Colors.redAccent),
    ),
    border: OutlineInputBorder(),
  ),
  primaryColor: Color(0xDAE0E2E7),
);

final kLightTheme = ThemeData().copyWith();
final kBlueTheme = ThemeData().copyWith();
final kPinkTheme = ThemeData().copyWith();
