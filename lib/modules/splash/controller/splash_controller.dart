import 'package:chamran/modules/main/screen/main_screen.dart';
import 'package:get/get.dart';
import 'package:chamran/model/response/refresh_token_response.dart';
import 'package:chamran/model/user/user.dart';
import 'package:chamran/modules/auth/screen/login_screen.dart';
import 'package:chamran/service/auth_service.dart';
import 'package:chamran/util/app_util.dart';
import 'package:chamran/util/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    refreshToken();
    super.onInit();
  }

  void refreshToken() async {
    User? user = SharedPreferences.getUser();
    if (user != null && user.refreshToken != null) {
      RefreshTokenResponse response =
          await AuthService.refreshToken(user.refreshToken!);
      if (response.statusCode == 200) {
        SharedPreferences.setUser(AppUtil.updateUserToken(user, response));
        AppUtil.getOffAllPage(const MainScreen());
        return;
      }
    }
    AppUtil.getOffAllPage(const LoginScreen());
  }
}
