
import 'package:json_annotation/json_annotation.dart';

part 'user_setting.g.dart';

@JsonSerializable()
class UserSetting {
  final String locale;
  final String appTheme;
  final String socialRole;
  final List<String>? groupsId;
  final bool? premium;

  UserSetting(
      {required this.locale,
        required this.appTheme,
        required this.socialRole,
        this.groupsId,
        this.premium});

  factory UserSetting.fromJson(Map<String, dynamic> json) => _$UserSettingFromJson(json);

  Map<String, dynamic> toJson() => _$UserSettingToJson(this);


}