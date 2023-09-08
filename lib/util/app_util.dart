import 'package:chamran/model/device/device.dart';
import 'package:chamran/model/response/refresh_token_response.dart';
import 'package:chamran/model/user/user.dart';
import 'package:chamran/modules/auth/screen/login_screen.dart';
import 'package:chamran/util/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class AppUtil {
  AppUtil._();

  static void print(String message) {
    debugPrint(message);
  }

  static Map<String, String> getFormHeaderWithoutToken() {
    return {
      "Content-Type": "application/x-www-form-urlencoded",
      "Accept": "application/json",
    };
  }

  static Map<String, String> getHeaderWithoutToken() {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Accept-Language': 'fa',
    };
  }

  static Map<String, String> getHeaderWithToken() {
    return {
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json",
      "Authorization": "Bearer ${SharedPreferences.getToken()}",
      'Accept-Language': 'fa',
    };
  }

  static void goToPage(Widget page) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Get.to(() => page);
    });
  }

  static void getOffAllPage(Widget page) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Get.offAll(() => page);
    });
  }

  static void removeFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static String getDateString(DateTime? date) {
    return date == null
        ? ''
        : '${date.year}-${date.month}-${date.day}  ${date.hour}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}';
  }

  static String replacePersianNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], persian[i]);
    }
    return input;
  }

  static User updateUserToken(User user, RefreshTokenResponse update) {
    user.tokenType = update.tokenType;
    user.accessToken = update.accessToken;
    user.expiresIn = update.expiresIn;
    user.timeStamp = update.timeStamp;
    return user;
  }

  static String? getFirstErrorString(Map<String, dynamic> result) {
    String? error;
    try {
      if (result['message'] != null) {
        error = result['message'];
      }
      if (result['result']?['message'] != null) {
        error = result['result']?['message'];
      }
      result['result']?.forEach((key, value) {
        error = List<String>.from(value).first;
      });
    } catch (ex) {
      return error;
    }
    return error;
  }

  static Future signOut() async {
    await SharedPreferences.erase();
    getOffAllPage(const LoginScreen());
  }

  static LatLng? extractLatLng(Device device) {
    num? lat = device.meta!['extra']?['latitude'];
    num? lng = device.meta!['extra']?['longitude'];
    if (lat != null && lng != null) {
      return LatLng(lat.toDouble(), lng.toDouble());
    }
    return null;
  }
}
