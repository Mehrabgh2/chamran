import 'package:chamran/modules/main/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chamran/model/request/login_request.dart';
import 'package:chamran/model/response/user_response.dart';
import 'package:chamran/service/auth_service.dart';
import 'package:chamran/util/app_util.dart';
import 'package:chamran/util/shared_preferences.dart';
import 'package:chamran/widget/snackbar/custom_snackbar.dart';

class LoginController extends GetxController {
  LoginController({required this.context});

  BuildContext context;
  bool isLoading = false;
  bool isButtonEnabled = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    LoginRequest? request = getRequest();
    if (request != null) {
      updateIsLoading(true);
      UserResponse response = await AuthService.login(request);
      if (response.statusCode == 200) {
        SharedPreferences.setUser(response.user);
        AppUtil.getOffAllPage(const MainScreen());
      } else {
        // ignore: use_build_context_synchronously
        CustomSnackbar.showFailure(context, response.message);
        AppUtil.print('ASD ${response.message}');
      }
      updateIsLoading(false);
    }
  }

  LoginRequest? getRequest() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      return LoginRequest(
          username: usernameController.text, password: passwordController.text);
    }
    return null;
  }

  void onTextChange(String _) {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      updateIsButtonEnabled(true);
    } else {
      updateIsButtonEnabled(false);
    }
  }

  updateIsLoading(bool value) {
    isLoading = value;
    update();
  }

  updateIsButtonEnabled(bool value) {
    isButtonEnabled = value;
    update();
  }
}
