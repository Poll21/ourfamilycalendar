part of 'setting_app_bloc.dart';

@immutable
abstract class SettingAppEvent {}

class SettingAppGetEvent extends SettingAppEvent{

}

class SettingAppSetEvent extends SettingAppEvent{
  final String? locale;
  final String? appTheme;
  final bool? isAuthorized;

  SettingAppSetEvent({required this.isAuthorized, required this.locale, required this.appTheme});
}