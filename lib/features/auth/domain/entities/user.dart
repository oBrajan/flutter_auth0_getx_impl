import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String? accessToken;
  final String? refreshToken;
  final String? idToken;
  final String? email;
  final String? name;
  final String? nickname;
  final String? picture;

  User({
    this.accessToken,
    this.refreshToken,
    this.idToken,
    this.email,
    this.name,
    this.nickname,
    this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
