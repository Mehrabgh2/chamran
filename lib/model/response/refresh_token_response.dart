import 'dart:convert';

import 'package:chamran/model/response/base_response.dart';
import 'package:chamran/util/app_util.dart';

RefreshTokenResponse refreshTokenResponseFromJson(String str) =>
    RefreshTokenResponse.fromJson(json.decode(str));

class RefreshTokenResponse extends BaseResponse {
  RefreshTokenResponse({
    this.tokenType,
    this.accessToken,
    this.expiresIn,
    this.timeStamp,
    super.statusCode,
    super.message,
  });

  String? tokenType;
  String? accessToken;
  int? expiresIn;
  int? timeStamp;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) {
    return RefreshTokenResponse(
      tokenType: json['token_type'] as String?,
      accessToken: json['access_token'] as String?,
      expiresIn: json['expires_in'] as int?,
      timeStamp: json['timeStamp'] as int?,
      message: AppUtil.getFirstErrorString(json),
    );
  }
}
