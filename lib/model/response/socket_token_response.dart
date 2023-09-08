import 'dart:convert';

import 'package:chamran/model/response/base_response.dart';
import 'package:chamran/util/app_util.dart';

SocketTokenResponse socketTokenResponseFromJson(String str) =>
    SocketTokenResponse.fromJson(json.decode(str));

class SocketTokenResponse extends BaseResponse {
  SocketTokenResponse({
    this.socketToken,
    super.statusCode,
    super.message,
  });

  String? socketToken;

  factory SocketTokenResponse.fromJson(Map<String, dynamic> json) {
    return SocketTokenResponse(
      socketToken: json['token_2'] as String?,
      message: AppUtil.getFirstErrorString(json),
    );
  }
}
