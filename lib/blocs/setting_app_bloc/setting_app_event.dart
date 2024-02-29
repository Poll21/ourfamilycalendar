part of 'setting_app_bloc.dart';

@immutable
abstract class SettingAppEvent {}

class SettingAppGetEvent extends SettingAppEvent{
}

class SettingAppSetEvent extends SettingAppEvent{
  final String userId;
  final String? groupId;
  final String? locale;
  final String? appTheme;
  final String? socialRole;
  final bool? isAuthorized;


  SettingAppSetEvent({required this.userId, this.groupId, this.isAuthorized,  this.locale,  this.socialRole,  this.appTheme});
}