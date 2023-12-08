// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Страница авторизации регистрации`
  String get logScrenn {
    return Intl.message(
      'Страница авторизации регистрации',
      name: 'logScrenn',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our family!!!`
  String get log_reg_title {
    return Intl.message(
      'Welcome to our family!!!',
      name: 'log_reg_title',
      desc: '',
      args: [],
    );
  }

  /// `Register using your`
  String get reg {
    return Intl.message(
      'Register using your',
      name: 'reg',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get reg_or {
    return Intl.message(
      'or',
      name: 'reg_or',
      desc: '',
      args: [],
    );
  }

  /// `Authorize by`
  String get log {
    return Intl.message(
      'Authorize by',
      name: 'log',
      desc: '',
      args: [],
    );
  }

  /// `My Family Calendar`
  String get log_title {
    return Intl.message(
      'My Family Calendar',
      name: 'log_title',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get log_Registration {
    return Intl.message(
      'Registration',
      name: 'log_Registration',
      desc: '',
      args: [],
    );
  }

  /// `Авторизация`
  String get log_Authorization {
    return Intl.message(
      'Авторизация',
      name: 'log_Authorization',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get log_Email {
    return Intl.message(
      'Email',
      name: 'log_Email',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get log_Phone {
    return Intl.message(
      'Phone number',
      name: 'log_Phone',
      desc: '',
      args: [],
    );
  }

  /// `phone number`
  String get log_phone {
    return Intl.message(
      'phone number',
      name: 'log_phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get log_Password1 {
    return Intl.message(
      'Password',
      name: 'log_Password1',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get log_Password2 {
    return Intl.message(
      'Confirm password',
      name: 'log_Password2',
      desc: '',
      args: [],
    );
  }

  /// `Это поле обязательно для заполнения.`
  String get log_empty {
    return Intl.message(
      'Это поле обязательно для заполнения.',
      name: 'log_empty',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email entered. Please check the entered data!`
  String get log_email_incorrect {
    return Intl.message(
      'Incorrect email entered. Please check the entered data!',
      name: 'log_email_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect phone number entered. Please check the entered data!`
  String get log_phone_incorrect {
    return Intl.message(
      'Incorrect phone number entered. Please check the entered data!',
      name: 'log_phone_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `The password must contain a number, lowercase and uppercase Latin letters`
  String get log_password_incorrect {
    return Intl.message(
      'The password must contain a number, lowercase and uppercase Latin letters',
      name: 'log_password_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `Password does not match!`
  String get log_password_incorrect_one {
    return Intl.message(
      'Password does not match!',
      name: 'log_password_incorrect_one',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get log_Login {
    return Intl.message(
      'Login',
      name: 'log_Login',
      desc: '',
      args: [],
    );
  }

  /// `Terms of use.`
  String get log_terms_of_Use {
    return Intl.message(
      'Terms of use.',
      name: 'log_terms_of_Use',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your acceptance of the user agreement!`
  String get log_terms_of_Use_no {
    return Intl.message(
      'Please confirm your acceptance of the user agreement!',
      name: 'log_terms_of_Use_no',
      desc: '',
      args: [],
    );
  }

  /// `Страница настроек`
  String get SettingsScreen {
    return Intl.message(
      'Страница настроек',
      name: 'SettingsScreen',
      desc: '',
      args: [],
    );
  }

  /// `Save changes`
  String get prof_sav {
    return Intl.message(
      'Save changes',
      name: 'prof_sav',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get prof_name {
    return Intl.message(
      'User Name',
      name: 'prof_name',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get Language_R {
    return Intl.message(
      'Russian',
      name: 'Language_R',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get Language_E {
    return Intl.message(
      'English',
      name: 'Language_E',
      desc: '',
      args: [],
    );
  }

  /// `Social role`
  String get social_role {
    return Intl.message(
      'Social role',
      name: 'social_role',
      desc: '',
      args: [],
    );
  }

  /// `Working`
  String get working {
    return Intl.message(
      'Working',
      name: 'working',
      desc: '',
      args: [],
    );
  }

  /// `Student`
  String get student {
    return Intl.message(
      'Student',
      name: 'student',
      desc: '',
      args: [],
    );
  }

  /// `Schoolboy`
  String get schoolboy {
    return Intl.message(
      'Schoolboy',
      name: 'schoolboy',
      desc: '',
      args: [],
    );
  }

  /// `Self-employed`
  String get self_employed {
    return Intl.message(
      'Self-employed',
      name: 'self_employed',
      desc: '',
      args: [],
    );
  }

  /// `Household`
  String get household {
    return Intl.message(
      'Household',
      name: 'household',
      desc: '',
      args: [],
    );
  }

  /// `Not determined`
  String get not_determined {
    return Intl.message(
      'Not determined',
      name: 'not_determined',
      desc: '',
      args: [],
    );
  }

  /// `Application_version`
  String get application_version {
    return Intl.message(
      'Application_version',
      name: 'application_version',
      desc: '',
      args: [],
    );
  }

  /// `About the app`
  String get about_app {
    return Intl.message(
      'About the app',
      name: 'about_app',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get change_password {
    return Intl.message(
      'Change password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Old password`
  String get old_password {
    return Intl.message(
      'Old password',
      name: 'old_password',
      desc: '',
      args: [],
    );
  }

  /// `Old password does not match`
  String get error_old_password {
    return Intl.message(
      'Old password does not match',
      name: 'error_old_password',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get new_password {
    return Intl.message(
      'New password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
