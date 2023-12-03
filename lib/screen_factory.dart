import 'package:flutter/material.dart';
import 'ui/screens/auth_screens/change_password_screen/change_password_screen.dart';
import 'ui/screens/auth_screens/login_screen/login_screen.dart';
import 'ui/screens/home_screen/home_screen.dart';
import 'ui/screens/loading_screen/loading_screen.dart';
import 'ui/screens/settings_screen/settings_screen.dart';

class ScreenFactory {
  Widget makeLoadingScreen() => const LoadingScreen();
  Widget makeHomeScreen() => const HomeScreen();
  Widget makeSettingsScreen() => const SettingsScreen();
  Widget makeChangePasswordScreen() => const ChangePasswordScreen();
  //
  // Widget makeRegistrationsScreen() => const RegistrationsScreen();
  //
  // Widget makeLoginScreen() => const LoginScreen();
  //
  // Widget makeRestoreConfirm() => const RestoreConfirm();
  //
  // Widget makeSecurityPinScreen() => const SecurityPinScreen();
}
