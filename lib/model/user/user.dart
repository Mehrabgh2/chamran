import 'package:equatable/equatable.dart';

import 'profile.dart';

// ignore: must_be_immutable
class User extends Equatable {
  String? tokenType;
  String? accessToken;
  int? expiresIn;
  int? timeStamp;
  Profile? profile;
  String? refreshToken;

  User({
    this.tokenType,
    this.accessToken,
    this.expiresIn,
    this.timeStamp,
    this.profile,
    this.refreshToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        tokenType: json['token_type'] as String?,
        accessToken: json['access_token'] as String?,
        expiresIn: json['expires_in'] as int?,
        timeStamp: json['timeStamp'] as int?,
        profile: json['profile'] == null
            ? null
            : Profile.fromJson(json['profile'] as Map<String, dynamic>),
        refreshToken: json['refresh_token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'token_type': tokenType,
        'access_token': accessToken,
        'expires_in': expiresIn,
        'timeStamp': timeStamp,
        'profile': profile?.toJson(),
        'refresh_token': refreshToken,
      };

  User copyWith({
    String? tokenType,
    String? accessToken,
    int? expiresIn,
    int? timeStamp,
    Profile? profile,
    String? refreshToken,
  }) {
    return User(
      tokenType: tokenType ?? this.tokenType,
      accessToken: accessToken ?? this.accessToken,
      expiresIn: expiresIn ?? this.expiresIn,
      timeStamp: timeStamp ?? this.timeStamp,
      profile: profile ?? this.profile,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      tokenType,
      accessToken,
      expiresIn,
      timeStamp,
      profile,
      refreshToken,
    ];
  }
}
