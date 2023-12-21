import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/blocs/loading_bloc/loading_bloc.dart';
import 'package:our_family_calendar/blocs/setting_app_bloc/setting_app_bloc.dart';
import 'package:our_family_calendar/constants/theme.dart';
import 'package:our_family_calendar/generated/l10n.dart';
import 'package:our_family_calendar/main_navigation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final mainNavigation = MainNavigation();
const secureStorage = FlutterSecureStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoadingBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: BlocConsumer<SettingAppBloc, SettingAppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          ThemeData? _myTheme;
          switch (state.appTheme) {
            case 'kLightTheme':
              _myTheme = kLightTheme;
              break;
            case 'kDarkTheme':
              _myTheme = kDarkTheme;
              break;
            case 'kBlueTheme':
              _myTheme = kBlueTheme;
              break;
            case 'kLightTheme':
              _myTheme = kPinkTheme;
              break;
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'OurFamilyCalendar',
            theme: _myTheme,
            locale: Locale(state.locale),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            routes: mainNavigation.routes,
          );
        },
      ),
    );
  }
}
