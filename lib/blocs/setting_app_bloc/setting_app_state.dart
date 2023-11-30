part of 'setting_app_bloc.dart';

@immutable
class SettingAppState {
  final String locale;
  final String appTheme;
  final bool isAuthorized;
  final String error;
  final String socialRole;

  const SettingAppState( {
    this.locale ='ru',
    this.appTheme = 'kDarkTheme',
    this.isAuthorized = false,
    this.error ='',
    this.socialRole ='',
  });

  SettingAppState copyWith({
    String? locale,
    String? appTheme,
    bool? isAuthorized,
    String? error,
    String? socialRole,
  }) {
    return SettingAppState(
      locale: locale ?? this.locale,
      appTheme: appTheme ?? this.appTheme,
      isAuthorized: isAuthorized ?? this.isAuthorized,
      error: error ?? this.error,
      socialRole: socialRole ?? this.socialRole,
    );
  }
}

class SettingAppInit extends SettingAppState {
  const SettingAppInit();
}