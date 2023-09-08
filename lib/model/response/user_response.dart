import 'dart:convert';

import 'package:chamran/model/response/base_response.dart';
import 'package:chamran/model/user/user.dart';
import 'package:chamran/util/app_util.dart';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

class UserResponse extends BaseResponse {
  UserResponse({this.user, super.statusCode, super.message});

  User? user;

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      user: User.fromJson(json),
      message: AppUtil.getFirstErrorString(json),
    );
  }
}
