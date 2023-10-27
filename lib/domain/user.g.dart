// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      isEmailVerified: json['isEmailVerified'] as String,
      isAnonymous: json['isAnonymous'] as String,
      metadata: json['metadata'] as String,
      phoneNumber: json['phoneNumber'] as String,
      photoURL: json['photoURL'] as String,
      providerData: json['providerData'] as String,
      refreshToken: json['refreshToken'] as String,
      tenantId: json['tenantId'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'isEmailVerified': instance.isEmailVerified,
      'isAnonymous': instance.isAnonymous,
      'metadata': instance.metadata,
      'phoneNumber': instance.phoneNumber,
      'photoURL': instance.photoURL,
      'providerData': instance.providerData,
      'refreshToken': instance.refreshToken,
      'tenantId': instance.tenantId,
      'uid': instance.uid,
    };
