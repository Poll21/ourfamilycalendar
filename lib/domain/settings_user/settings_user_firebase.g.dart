// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_user_firebase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsUserFirebase _$SettingsUserFirebaseFromJson(
        Map<String, dynamic> json) =>
    SettingsUserFirebase(
      settings: UserSetting.fromJson(json['settings'] as Map<String, dynamic>),
      idUser: json['idUser'] as String,
    );

Map<String, dynamic> _$SettingsUserFirebaseToJson(
        SettingsUserFirebase instance) =>
    <String, dynamic>{
      'idUser': instance.idUser,
      'settings': instance.settings,
    };
