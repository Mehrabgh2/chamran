import 'package:chamran/util/app_theme.dart';
import 'package:chamran/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({
    super.key,
    required this.isLoading,
    required this.submit,
  });

  final RxBool isLoading;
  final VoidCallback submit;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      title: Center(
          child: Text(
        'خروج',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'ShabnamBold',
          fontWeight: FontWeight.bold,
          fontSize: size.width * .04,
          color: AppTheme.textfieldTextColor,
        ),
      )),
      backgroundColor: AppTheme.backgroundColor,
      content: Text(
        'میخواهید از حساب کاربری خود خارج شوید؟',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'ShabnamMedium',
          fontSize: size.width * .03,
          color: AppTheme.textfieldHintColor,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: size.height * .005,
            horizontal: size.width * .01,
          ),
          height: size.height * .06,
          child: Obx(
            () => Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'خیر',
                    onPressed: isLoading.value
                        ? () {}
                        : () {
                            Get.back();
                          },
                    enabled: true,
                  ),
                ),
                SizedBox(width: size.width * .03),
                Expanded(
                  child: isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                              color: AppTheme.progressColor))
                      : CustomButton(
                          text: 'بله',
                          onPressed: submit,
                          enabled: true,
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
