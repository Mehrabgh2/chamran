import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:chamran/modules/auth/controller/login_controller.dart';
import 'package:chamran/util/app_theme.dart';
import 'package:chamran/widget/custom_button.dart';
import 'package:chamran/widget/custom_text_filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          'نوتاش',
          style: TextStyle(
            fontFamily: 'ShabnamBold',
            fontSize: size.width * .045,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<LoginController>(
        init: LoginController(context: context),
        builder: (controller) {
          return SizedBox(
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: controller.usernameController,
                  hintText: 'نام کاربری',
                  isNext: true,
                  onChanged: controller.onTextChange,
                ),
                SizedBox(height: size.height * .005),
                CustomTextField(
                  controller: controller.passwordController,
                  hintText: 'رمز عبور',
                  isPassword: true,
                  isNext: false,
                  onChanged: controller.onTextChange,
                ),
                SizedBox(height: size.height * .035),
                controller.isLoading
                    ? Container(
                        height: size.height * .07,
                        width: size.height * .07,
                        padding: EdgeInsets.all(size.height * .0125),
                        child: const CircularProgressIndicator())
                    : CustomButton(
                        onPressed: controller.login,
                        text: 'ورود به نوتاش',
                        enabled: controller.isButtonEnabled,
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
