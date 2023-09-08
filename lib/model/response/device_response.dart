import 'dart:convert';

import 'package:chamran/model/device/device.dart';
import 'package:chamran/model/response/base_response.dart';
import 'package:chamran/util/app_util.dart';

DeviceResponse deviceResponseFromJson(String str) =>
    DeviceResponse.fromJson(json.decode(str));

class DeviceResponse extends BaseResponse {
  final List<Device>? devices;
  final bool? hasNext;
  final int? totalElements;
  final int? totalPages;

  DeviceResponse({
    this.devices,
    this.hasNext,
    this.totalElements,
    this.totalPages,
    super.message,
    super.statusCode,
  });

  factory DeviceResponse.fromJson(Map<String, dynamic> json) => DeviceResponse(
        devices: json['result'] != null && json['result']['data'] != null
            ? List<Device>.from(
                json['result']['data'].map((x) => Device.fromJson(x)))
            : [],
        hasNext: json['result']['hasNext'] as bool?,
        totalElements: json['result']['totalElements'] as int?,
        totalPages: json['result']['totalPages'] as int?,
        message: AppUtil.getFirstErrorString(json),
      );
}
