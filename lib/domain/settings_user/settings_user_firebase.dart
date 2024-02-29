import 'package:json_annotation/json_annotation.dart';
import 'package:our_family_calendar/domain/settings_user/user_setting.dart';

part 'settings_user_firebase.g.dart';

@JsonSerializable()
class SettingsUserFirebase {
  final String idUser;
  final UserSetting settings;

  SettingsUserFirebase({required this.settings, required this.idUser});

  factory SettingsUserFirebase.fromJson(Map<String, dynamic> json) => _$SettingsUserFirebaseFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsUserFirebaseToJson(this);
}
