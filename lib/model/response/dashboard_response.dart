import 'dart:convert';

import 'package:chamran/model/dashboard/dashboard.dart';
import 'package:chamran/model/response/base_response.dart';
import 'package:chamran/util/app_util.dart';

DashboardResponse dashboardResponseFromJson(String str) =>
    DashboardResponse.fromJson(json.decode(str));

class DashboardResponse extends BaseResponse {
  final List<Dashboard>? dashboards;
  final bool? hasNext;
  final int? totalElements;
  final int? totalPages;

  DashboardResponse({
    this.dashboards,
    this.hasNext,
    this.totalElements,
    this.totalPages,
    super.message,
    super.statusCode,
  });

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      DashboardResponse(
        dashboards: json['result'] != null && json['result']['data'] != null
            ? List<Dashboard>.from(
                json['result']['data'].map((x) => Dashboard.fromJson(x)))
            : [],
        hasNext: json['result']['hasNext'] as bool?,
        totalElements: json['result']['totalElements'] as int?,
        totalPages: json['result']['totalPages'] as int?,
        message: AppUtil.getFirstErrorString(json),
      );
}
