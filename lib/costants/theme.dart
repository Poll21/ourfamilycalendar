import 'package:flutter/material.dart';

final kDarkTheme = ThemeData().copyWith(
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.red
  ),
  iconTheme: IconThemeData(color: Colors.red),
iconButtonTheme: IconButtonThemeData(),
  appBarTheme: const AppBarTheme(color: Colors.black),
  scaffoldBackgroundColor: Colors.black45,
  focusColor: Colors.pink,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        fontFamily: 'Montserrat',
        color: Colors.white),
    headlineMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        fontFamily: 'Montserrat',
        color: Colors.white),
    headlineSmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        fontFamily: 'Montserrat',
        color: Colors.white),
    titleLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        fontFamily: 'Montserrat',
        color: Colors.white),
    titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        fontFamily: 'Montserrat',
        color: Colors.white),
    titleSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        fontFamily: 'Montserrat',
        color: Colors.white),
    bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        fontFamily: 'Montserrat',
        color: Colors.white),
    bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        fontFamily: 'Montserrat',
        color: Colors.white),
    bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        fontFamily: 'Montserrat',
        color: Colors.white),
    displayLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        fontFamily: 'Montserrat',
        color: Colors.black),
    displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        fontFamily: 'Montserrat',
        color: Colors.black),
    displaySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        fontFamily: 'Montserrat',
        color: Colors.black),
    labelLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        fontFamily: 'Montserrat',
        color: Colors.black),
    labelMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        fontFamily: 'Montserrat',
        color: Colors.black),
    labelSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        fontFamily: 'Montserrat',
        color: Colors.black),
  ),


  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black54,
          shadowColor: Colors.white60,
          textStyle: const TextStyle(
            fontSize: 16,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ))),
  textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: Colors.grey,
      selectionHandleColor: Colors.grey),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      gapPadding: 50,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 1, color: Colors.white),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 2, color: Colors.white),
    ),
    errorBorder: OutlineInputBorder(
      gapPadding: 50,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 2, color: Colors.red),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 2, color: Colors.white),
    ),
    focusedErrorBorder: OutlineInputBorder(
      gapPadding: 50,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 3, color: Colors.redAccent),
    ),
    border: OutlineInputBorder(),
  ),
  primaryColor: Colors.white,
);

final kLightTheme = ThemeData().copyWith();
final kBlueTheme = ThemeData().copyWith();
final kPinkTheme = ThemeData().copyWith();
