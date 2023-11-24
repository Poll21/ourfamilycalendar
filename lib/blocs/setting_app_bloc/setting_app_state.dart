part of 'setting_app_bloc.dart';

@immutable
class SettingAppState {
  final String locale;
  final String appTheme;
  final bool isAuthorized;
  final String error;

  const SettingAppState({
    this.locale ='ru',
    this.appTheme = 'kDarkTheme',
    this.isAuthorized = false,
    this.error ='',
  });

  SettingAppState copyWith({
    String? locale,
    String? appTheme,
    bool? isAuthorized,
    String? error,
  }) {
    return SettingAppState(
      locale: locale ?? this.locale,
      appTheme: appTheme ?? this.appTheme,
      isAuthorized: isAuthorized ?? this.isAuthorized,
      error: error ?? this.error,
    );
  }
}
class SettingAppInit extends SettingAppState {
  const SettingAppInit();
}