import 'dart:async';

import 'package:chamran/model/response/dashboard_response.dart';
import 'package:chamran/model/widget/dm_widgets_response.dart';
import 'package:chamran/util/app_util.dart';
import 'package:chamran/util/constants.dart';
import 'package:http/http.dart' as http;

class DashboardService {
  static Future<DMWidgetsResponse> getOneDashboard(String id) async {
    DMWidgetsResponse dMWidgetsResponse = DMWidgetsResponse();
    try {
      final request = http.Request(
          'GET', Uri.parse('${Constants.baseUrl}${Constants.dashboard}/$id'));
      request.headers.addAll(AppUtil.getHeaderWithToken());
      http.StreamedResponse response = await request
          .send()
          .timeout(const Duration(seconds: Constants.timeoutSecond));
      final responseStr = (await http.Response.fromStream(response)).body;
      AppUtil.print(responseStr);
      if (response.statusCode == 200 || response.statusCode == 201) {
        dMWidgetsResponse = dMWidgetsResponseFromJson(responseStr);
        dMWidgetsResponse.statusCode = 200;
        return dMWidgetsResponse;
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        dMWidgetsResponse = dMWidgetsResponseFromJson(responseStr);
        dMWidgetsResponse.statusCode = response.statusCode;
        return dMWidgetsResponse;
      } else {
        dMWidgetsResponse.statusCode = response.statusCode;
        return dMWidgetsResponse;
      }
    } on TimeoutException catch (_) {
      dMWidgetsResponse.statusCode = 601;
      return dMWidgetsResponse;
    } catch (error) {
      dMWidgetsResponse.statusCode = 500;
      return dMWidgetsResponse;
    }
  }

  static Future<DashboardResponse> getDashboards(int page) async {
    DashboardResponse dashboardResponse = DashboardResponse();
    try {
      final request = http.Request(
          'GET',
          Uri.parse(
              '${Constants.baseUrl}${Constants.dashboard}?page=$page&pageSize=20'));
      request.headers.addAll(AppUtil.getHeaderWithToken());
      http.StreamedResponse response = await request
          .send()
          .timeout(const Duration(seconds: Constants.timeoutSecond));
      final responseStr = (await http.Response.fromStream(response)).body;
      AppUtil.print(responseStr);
      if (response.statusCode == 200 || response.statusCode == 201) {
        dashboardResponse = dashboardResponseFromJson(responseStr);
        dashboardResponse.statusCode = 200;
        return dashboardResponse;
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        dashboardResponse = dashboardResponseFromJson(responseStr);
        dashboardResponse.statusCode = response.statusCode;
        return dashboardResponse;
      } else {
        dashboardResponse.statusCode = response.statusCode;
        return dashboardResponse;
      }
    } on TimeoutException catch (_) {
      dashboardResponse.statusCode = 601;
      return dashboardResponse;
    } catch (error) {
      dashboardResponse.statusCode = 500;
      return dashboardResponse;
    }
  }
}
