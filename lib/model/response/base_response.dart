import 'dart:convert';

BaseResponse baseResponseFromJson(String str) =>
    BaseResponse.fromJson(json.decode(str));

class BaseResponse {
  BaseResponse({this.message, this.statusCode});

  String? message;
  int? statusCode;

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      message: json['message'] as String?,
    );
  }
}
