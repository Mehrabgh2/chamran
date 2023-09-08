import 'dart:convert';

import 'package:chamran/model/user/user.dart';
import 'package:get_storage/get_storage.dart';

import 'constants.dart';

class SharedPreferences {
  SharedPreferences._();

  static String getToken() {
    User? user = getUser();
    if (user != null) {
      return user.accessToken ?? '';
    }
    return '';
  }

  static User? getUser() {
    var data = GetStorage().read(Constants.userBox);
    if (data == null) {
      return null;
    }
    User user = User.fromJson(json.decode(data));
    return user;
  }

  static void setUser(User? user) {
    if (user != null) {
      GetStorage().write(Constants.userBox, json.encode(user.toJson()));
    }
  }

  static String? getDashboardId() {
    var data = GetStorage().read(Constants.dashboardIdBox);
    if (data == null) {
      return null;
    }
    return json.decode(data)['dashboard_id'];
  }

  static void setDashboardId(String dashboardId) {
    GetStorage().write(
        Constants.dashboardIdBox, json.encode({'dashboard_id': dashboardId}));
  }

  static String? getDeviceId() {
    var data = GetStorage().read(Constants.deviceIdBox);
    if (data == null) {
      return null;
    }
    return json.decode(data)['device_id'];
  }

  static void setDeviceId(String deviceId) {
    GetStorage()
        .write(Constants.deviceIdBox, json.encode({'device_id': deviceId}));
  }

  static Future erase() async {
    await GetStorage().erase();
  }
}
