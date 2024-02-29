// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSetting _$UserSettingFromJson(Map<String, dynamic> json) => UserSetting(
      locale: json['locale'] as String,
      appTheme: json['appTheme'] as String,
      socialRole: json['socialRole'] as String,
      groupsId: (json['groupsId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      premium: json['premium'] as bool?,
    );

Map<String, dynamic> _$UserSettingToJson(UserSetting instance) =>
    <String, dynamic>{
      'locale': instance.locale,
      'appTheme': instance.appTheme,
      'socialRole': instance.socialRole,
      'groupsId': instance.groupsId,
      'premium': instance.premium,
    };
