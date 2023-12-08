import 'package:flutter/material.dart';

final kDarkTheme = ThemeData().copyWith(
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStatePropertyAll<Color>(Colors.black54),
    checkColor: MaterialStatePropertyAll<Color>(Colors.white),
  ),
  buttonTheme: ButtonThemeData(buttonColor: Colors.red),
  iconTheme: IconThemeData(color: Colors.white),
  iconButtonTheme: IconButtonThemeData(
    style:
        ButtonStyle(iconColor: MaterialStatePropertyAll<Color>(Colors.white)),
  ),
  appBarTheme: const AppBarTheme(color: Colors.black),
  scaffoldBackgroundColor: Colors.grey,
  focusColor: Colors.red,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        fontFamily: 'Montserrat',
        color: Colors.white),
    headlineMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        fontFamily: 'Montserrat',
        color: Colors.white),
    headlineSmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
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
      selectionColor: Colors.black54,
      selectionHandleColor: Colors.grey),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.grey),
    suffixIconColor: Colors.white,
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
      borderSide: BorderSide(width: 2, color: Color(0xffb0564f)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 2, color: Colors.white),
    ),
    focusedErrorBorder: OutlineInputBorder(
      gapPadding: 50,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 3, color: Color(0xffb0564f)),
    ),
    border: OutlineInputBorder(),
  ),
  primaryColor: Colors.white,
  drawerTheme: DrawerThemeData(backgroundColor: Colors.grey,)
);

final kLightTheme = ThemeData().copyWith();
final kBlueTheme = ThemeData().copyWith();
final kPinkTheme = ThemeData().copyWith();
