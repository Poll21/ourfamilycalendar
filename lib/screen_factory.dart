import 'package:flutter/material.dart';
import 'ui/screens/auth_screens/login_screen/login_screen.dart';
import 'ui/screens/loading_screen/loading_screen.dart';

class ScreenFactory {
  Widget makeLoadingScreen() => const LoadingScreen();

  // Widget makeFirstLoadingScreen() => const FirstLoadingScreen();
  //
  // Widget makeGCaptchaScreen() => GCaptchaScreen();
  //
  // Widget makeBottomNavigationScreens() => const BottomNavigationScreens();
  //
  // Widget makeRegistrationsScreen() => const RegistrationsScreen();
  //
  // Widget makeLoginScreen() => const LoginScreen();
  //
  // Widget makeRestoreConfirm() => const RestoreConfirm();
  //
  // Widget makeSecurityPinScreen() => const SecurityPinScreen();
}
