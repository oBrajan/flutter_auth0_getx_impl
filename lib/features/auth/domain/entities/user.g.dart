// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    accessToken: json['accessToken'] as String?,
    refreshToken: json['refreshToken'] as String?,
    idToken: json['idToken'] as String?,
    email: json['email'] as String?,
    name: json['name'] as String?,
    nickname: json['nickname'] as String?,
    picture: json['picture'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'idToken': instance.idToken,
      'email': instance.email,
      'name': instance.name,
      'nickname': instance.nickname,
      'picture': instance.picture,
    };
