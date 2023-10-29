import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_user.g.dart';

@JsonSerializable()
class MyUser {
  final String displayName;
  final String email;
  final String phoneNumber;
  final String photoURL;
  final String refreshToken;
  final String tenantId;
  final String uid;

  MyUser(
      {required this.displayName,
      required this.email,
      required this.phoneNumber,
      required this.photoURL,
      required this.refreshToken,
      required this.tenantId,
      required this.uid});

  factory MyUser.fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);

  Map<String, dynamic> toJson() => _$MyUserToJson(this);

  factory MyUser.setUserCredential(User user) => MyUser(
      displayName: user.displayName ?? '',
      email: user.email ?? '',
      phoneNumber: user.phoneNumber ?? '',
      photoURL: user.photoURL ?? '',
      refreshToken: user.refreshToken ?? '',
      tenantId: user.tenantId ?? '',
      uid: user.uid ?? '');
}
