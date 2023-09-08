import 'package:flutter/material.dart';
import 'package:chamran/widget/snackbar/templated_snackbar.dart';

class CustomSnackbar {
  static void showSuccess(BuildContext context, String? description) {
    final size = MediaQuery.of(context).size;
    TemplatedSnackbar.showTemplatedSnackbar(
      context: context,
      backgroundColor: Colors.green,
      animateFrom: MediaQuery.of(context).viewInsets.bottom == 0
          ? AnimateFrom.fromBottom
          : AnimateFrom.fromTop,
      leading: Container(
        margin: EdgeInsets.only(left: size.width * .035),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.2),
        ),
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
      titleWidget: Text(
        'موفقیت آمیز',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontFamily: 'ShabnamBold',
          fontSize: size.width * .03,
          color: Colors.white,
        ),
      ),
      subTitleWidget: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          description ?? 'عملیات با مشکل مواجه شد',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontFamily: 'ShabnamMedium',
            fontSize: size.width * .03,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  static void showFailure(BuildContext context, String? description) {
    final size = MediaQuery.of(context).size;
    TemplatedSnackbar.showTemplatedSnackbar(
      context: context,
      backgroundColor: Colors.red,
      animateFrom: MediaQuery.of(context).viewInsets.bottom == 0
          ? AnimateFrom.fromBottom
          : AnimateFrom.fromTop,
      leading: Container(
        margin: EdgeInsets.only(left: size.width * .035),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.2),
        ),
        child: const Icon(
          Icons.error_outline_rounded,
          color: Colors.white,
        ),
      ),
      titleWidget: Text(
        'خطا',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontFamily: 'ShabnamBold',
          fontSize: size.width * .03,
          color: Colors.white,
        ),
      ),
      subTitleWidget: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          description ?? 'عملیات با مشکل مواجه شد',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontFamily: 'ShabnamMedium',
            fontSize: size.width * .03,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
