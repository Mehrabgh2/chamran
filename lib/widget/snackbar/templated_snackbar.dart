import 'package:flutter/material.dart';
import 'package:chamran/widget/snackbar/base_snackbar.dart';

// ignore: must_be_immutable
class TemplatedSnackbar extends BaseSnackBar {
  TemplatedSnackbar({
    super.key,
    required title,
    required subTitle,
    required titleStyle,
    required subTitleStyle,
    required backgroundColor,
    required duration,
    required contentPadding,
    required outerPadding,
    required borderRadius,
    required animationCurve,
    required animateFrom,
    required elevation,
    required persist,
    required onDismissed,
    titleWidget,
    subTitleWidget,
    leading,
    trailing,
    shadowColor,
    distanceToTravelFromStartToEnd,
  }) : super(
          shadowColor: shadowColor,
          duration: duration,
          animationCurve: animationCurve,
          animateFrom: animateFrom,
          elevation: elevation,
          persist: persist,
          onDismissed: onDismissed,
          outerPadding: outerPadding,
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
          distanceToTravelFromStartToEnd: distanceToTravelFromStartToEnd,
          child: Container(
            padding: contentPadding,
            child: Row(
              children: [
                if (trailing != null) trailing!,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      title.isNotEmpty
                          ? Text(
                              title,
                              style: titleStyle,
                            )
                          : titleWidget != null
                              ? titleWidget!
                              : const SizedBox(),
                      subTitle.isNotEmpty
                          ? Text(
                              subTitle,
                              style: subTitleStyle,
                            )
                          : subTitleWidget != null
                              ? subTitleWidget!
                              : const SizedBox(),
                    ],
                  ),
                ),
                if (leading != null) leading!,
              ],
            ),
          ),
        );

  ///Creates snackbar with predefined template.
  static void showTemplatedSnackbar({
    required BuildContext context,
    String? title,
    String? subTitle,
    TextStyle? titleStyle,
    TextStyle? subTitleStyle,
    Widget? titleWidget,
    Widget? subTitleWidget,
    Widget? leading,
    Widget? trailing,
    Color? backgroundColor,
    Duration? duration,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? outerPadding,
    BorderRadius? borderRadius,
    Curve? animationCurve,
    AnimateFrom? animateFrom,
    double? elevation,
    Color? shadowColor,
    bool? persist,
    double? distanceToTravel,
  }) {
    duration ??= const Duration(milliseconds: 1000);

    // Get the OverlayState
    final overlayState = Overlay.of(context);
    // Create an OverlayEntry with your custom widget
    OverlayEntry? snackBar;
    snackBar = OverlayEntry(
      builder: (_) => TemplatedSnackbar(
        title: title ??= "",
        subTitle: subTitle ??= "",
        titleStyle: titleStyle ??= const TextStyle(color: Colors.white),
        subTitleStyle: subTitleStyle ??= const TextStyle(color: Colors.white),
        titleWidget: titleWidget,
        subTitleWidget: subTitleWidget,
        leading: leading,
        trailing: trailing,
        backgroundColor: backgroundColor ??= Colors.blue,
        duration: duration!,
        contentPadding: contentPadding ??= const EdgeInsets.all(20),
        borderRadius: borderRadius ??= BorderRadius.circular(10),
        animationCurve: animationCurve ??= Curves.ease,
        outerPadding: outerPadding ??=
            const EdgeInsets.symmetric(horizontal: 10),
        animateFrom: animateFrom ??= AnimateFrom.fromBottom,
        elevation: elevation ??= 0.0,
        shadowColor: shadowColor,
        distanceToTravelFromStartToEnd: distanceToTravel ??= 20,
        persist: persist ??= false,
        onDismissed: persist!
            ? () {
                if (snackBar != null) {
                  _removeOverlayEntry(snackBar);
                }
              }
            : () {},
      ),
    );

    // then insert it to the overlay
    // this will show the toast widget on the screen
    overlayState.insert(snackBar);
    // 3 secs later remove the toast from the stack
    // and this one will remove the toast from the screen
    if (persist == null || !persist!) {
      Future.delayed(duration * 2, snackBar.remove);
    }
  }

  static void _removeOverlayEntry(OverlayEntry overlayEntry) {
    overlayEntry.remove();
  }
}

enum AnimateFrom {
  fromTop,
  fromBottom,
}
