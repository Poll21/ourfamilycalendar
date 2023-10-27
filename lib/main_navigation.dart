import 'package:flutter/material.dart';
import 'package:our_family_calendar/screen_factory.dart';

abstract class Screens {
  static const main = "/";
  // static const pinScreen = "/pinScreen";
  // static const bottomNavigationScreens = "/bottomNavigationScreens";
  // static const registrationsScreens = "/registrationsScreens";
  // static const loginScreen = "/loginScreen";
  // static const noUserAuthorization = "/noUserAuthorization";
  // static const restoreConfirm = "/loginScreen/restoreConfirm";
  // static const gCaptcha = "/gCaptcha";
}

class MainNavigation {
  final _screenFactory = ScreenFactory();

  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
    Screens.main: (_) => _screenFactory.makeLoadingScreen(),
    // Screens.bottomNavigationScreens: (_) =>
    //     _screenFactory.makeBottomNavigationScreens(),
    // Screens.gCaptcha: (_) => _screenFactory.makeGCaptchaScreen(),
    // Screens.pinScreen: (_) => _screenFactory.makeSecurityPinScreen(),
    // Screens.loginScreen: (_) => _screenFactory.makeLoginScreen(),
    // Screens.restoreConfirm: (_) => _screenFactory.makeRestoreConfirm(),
  };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return null;
  }
}
