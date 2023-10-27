import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()

class User{
  final String displayName;
  final String email;
  final String isEmailVerified;
  final String isAnonymous;
  final String metadata;
  final String phoneNumber;
  final String photoURL;
  final String providerData;
  final String refreshToken;
  final String tenantId;
  final String uid;

  User(
      {required this.displayName,
      required this.email,
      required this.isEmailVerified,
      required this.isAnonymous,
      required this.metadata,
      required this.phoneNumber,
      required this.photoURL,
      required this.providerData,
      required this.refreshToken,
      required this.tenantId,
      required this.uid});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}