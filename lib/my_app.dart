import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/blocs/internet_connect/internet_connect_cubit.dart';
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
    return BlocListener<InternetConnectCubit, InternetConnectState>(
      listener: (context, internetState) {
        String connect = "unknown";
        switch (internetState.type) {
          case InternetType.online:
            connect = 'online';
            break;
          case InternetType.offline:
            connect = 'offline';
            break;
            case InternetType.unknown:
            connect = 'unknown';
            break;
        }
        print(connect);
      },
      child: BlocConsumer<SettingAppBloc, SettingAppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          ThemeData? myTheme;
          switch (state.appTheme) {
            case 'kLightTheme':
              myTheme = kLightTheme;
              break;
            case 'kDarkTheme':
              myTheme = kDarkTheme;
              break;
            case 'kBlueTheme':
              myTheme = kBlueTheme;
              break;
            case 'kLightTheme':
              myTheme = kPinkTheme;
              break;
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'OurFamilyCalendar',
            theme: myTheme,
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
