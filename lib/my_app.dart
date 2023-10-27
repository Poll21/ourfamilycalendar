import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:our_family_calendar/costants/theme.dart';
import 'package:our_family_calendar/generated/l10n.dart';
import 'package:our_family_calendar/main_navigation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


final mainNavigation = MainNavigation();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OurFamilyCalendar',
        theme: kDarkTheme,
        locale: Locale('ru'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routes: mainNavigation.routes,
    );
  }
}