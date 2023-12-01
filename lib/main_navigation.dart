import 'package:flutter/material.dart';
import 'package:our_family_calendar/screen_factory.dart';

abstract class Screens {
  static const main = "/";
  static const home = "/home";
  static const settings = "/home/settings";
  static const changePassword = "/home/settings/change_password";
  // static const loginScreen = "/loginScreen";
  // static const noUserAuthorization = "/noUserAuthorization";
  // static const restoreConfirm = "/loginScreen/restoreConfirm";
  // static const gCaptcha = "/gCaptcha";
}

class MainNavigation {
  final _screenFactory = ScreenFactory();

  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
    Screens.main: (_) => _screenFactory.makeLoadingScreen(),
    Screens.home: (_) => _screenFactory.makeHomeScreen(),
    Screens.settings: (_) => _screenFactory.makeSettingsScreen(),
    Screens.changePassword: (_) => _screenFactory.makeChangePasswordScreen(),
    // Screens.loginScreen: (_) => _screenFactory.makeLoginScreen(),
    // Screens.restoreConfirm: (_) => _screenFactory.makeRestoreConfirm(),
  };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return null;
  }
}
