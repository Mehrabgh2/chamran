import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:chamran/model/request/login_request.dart';
import 'package:chamran/model/response/base_response.dart';
import 'package:chamran/model/response/refresh_token_response.dart';
import 'package:chamran/model/response/socket_token_response.dart';
import 'package:chamran/model/response/user_response.dart';
import 'package:chamran/util/app_util.dart';
import 'package:chamran/util/constants.dart';
import 'package:chamran/util/sentry_capture_exception.dart';

class AuthService {
  static Future<UserResponse> login(LoginRequest loginRequest) async {
    UserResponse userResponse = UserResponse();
    try {
      final request = http.Request(
          'POST', Uri.parse(Constants.baseUrl + Constants.loginUrl));
      request.bodyFields = loginRequest.toJson();
      request.headers.addAll(AppUtil.getFormHeaderWithoutToken());
      http.StreamedResponse response = await request
          .send()
          .timeout(const Duration(seconds: Constants.timeoutSecond));
      final responseStr = (await http.Response.fromStream(response)).body;
      AppUtil.print(responseStr);
      if (response.statusCode == 200 || response.statusCode == 201) {
        userResponse = userResponseFromJson(responseStr);
        userResponse.statusCode = 200;
        return userResponse;
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        userResponse = userResponseFromJson(responseStr);
        userResponse.statusCode = response.statusCode;
        return userResponse;
      } else {
        userResponse.statusCode = response.statusCode;
        return userResponse;
      }
    } on TimeoutException catch (_) {
      userResponse.statusCode = 601;
      return userResponse;
    } catch (error, stack) {
      SentryErrorReport().captureException(error, stack);
      userResponse.statusCode = 500;
      return userResponse;
    }
  }

  static Future<SocketTokenResponse> getSocketToken() async {
    SocketTokenResponse socketTokenResponse = SocketTokenResponse();
    try {
      final request = http.Request(
          'GET', Uri.parse(Constants.baseUrl + Constants.tokensUrl));
      request.headers.addAll(AppUtil.getHeaderWithToken());
      http.StreamedResponse response = await request
          .send()
          .timeout(const Duration(seconds: Constants.timeoutSecond));
      final responseStr = (await http.Response.fromStream(response)).body;
      AppUtil.print(responseStr);
      if (response.statusCode == 200 || response.statusCode == 201) {
        socketTokenResponse = socketTokenResponseFromJson(responseStr);
        socketTokenResponse.statusCode = 200;
        return socketTokenResponse;
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        socketTokenResponse = socketTokenResponseFromJson(responseStr);
        socketTokenResponse.statusCode = response.statusCode;
        return socketTokenResponse;
      } else {
        socketTokenResponse.statusCode = response.statusCode;
        return socketTokenResponse;
      }
    } on TimeoutException catch (_) {
      socketTokenResponse.statusCode = 601;
      return socketTokenResponse;
    } catch (error, stack) {
      SentryErrorReport().captureException(error, stack);
      socketTokenResponse.statusCode = 500;
      return socketTokenResponse;
    }
  }

  static Future<RefreshTokenResponse> refreshToken(String refreshToken) async {
    RefreshTokenResponse refreshTokenResponse = RefreshTokenResponse();
    try {
      final request = http.Request(
          'POST', Uri.parse(Constants.baseUrl + Constants.refreshTokenUrl));
      request.headers.addAll(AppUtil.getHeaderWithoutToken());
      request.headers.addAll({'Authorization': refreshToken});
      http.StreamedResponse response = await request
          .send()
          .timeout(const Duration(seconds: Constants.timeoutSecond));
      final responseStr = (await http.Response.fromStream(response)).body;
      AppUtil.print(responseStr);
      if (response.statusCode == 200 || response.statusCode == 201) {
        refreshTokenResponse = refreshTokenResponseFromJson(responseStr);
        refreshTokenResponse.statusCode = 200;
        return refreshTokenResponse;
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        refreshTokenResponse = refreshTokenResponseFromJson(responseStr);
        refreshTokenResponse.statusCode = response.statusCode;
        return refreshTokenResponse;
      } else {
        refreshTokenResponse.statusCode = response.statusCode;
        return refreshTokenResponse;
      }
    } on TimeoutException catch (_) {
      refreshTokenResponse.statusCode = 601;
      return refreshTokenResponse;
    } catch (error, stack) {
      SentryErrorReport().captureException(error, stack);
      refreshTokenResponse.statusCode = 500;
      return refreshTokenResponse;
    }
  }

  static Future<BaseResponse> logout() async {
    BaseResponse baseResponse = BaseResponse();
    try {
      final request = http.Request(
          'POST', Uri.parse(Constants.baseUrl + Constants.logoutUrl));
      request.headers.addAll(AppUtil.getHeaderWithToken());
      http.StreamedResponse response = await request
          .send()
          .timeout(const Duration(seconds: Constants.timeoutSecond));
      final responseStr = (await http.Response.fromStream(response)).body;
      AppUtil.print(responseStr);
      if (response.statusCode == 200 || response.statusCode == 201) {
        baseResponse = baseResponseFromJson(responseStr);
        baseResponse.statusCode = 200;
        return baseResponse;
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        baseResponse = baseResponseFromJson(responseStr);
        baseResponse.statusCode = response.statusCode;
        return baseResponse;
      } else {
        baseResponse.statusCode = response.statusCode;
        return baseResponse;
      }
    } on TimeoutException catch (_) {
      baseResponse.statusCode = 601;
      return baseResponse;
    } catch (error, stack) {
      SentryErrorReport().captureException(error, stack);
      baseResponse.statusCode = 500;
      return baseResponse;
    }
  }
}
