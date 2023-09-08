import 'package:chamran/util/app_util.dart';
import 'package:chamran/widget/svg_widget.dart';
import 'package:flutter/material.dart';

class WidgetContainer extends StatelessWidget {
  const WidgetContainer({
    required this.color,
    required this.icon,
    required this.title,
    this.value,
    this.sign,
    this.child,
    super.key,
  });
  final Color color;
  final String icon;
  final String title;
  final String? value;
  final String? sign;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .4,
      height: size.width * .4,
      padding: EdgeInsets.only(
        top: size.height * .009,
        bottom: size.height * .009,
        left: size.width * .02,
        right: size.width * .05,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(200),
            spreadRadius: -3,
            blurRadius: 20,
            blurStyle: BlurStyle.outer,
            offset: const Offset(-3, -3),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          stops: const [-.45, .45],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(.2),
            Colors.transparent,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * .07,
                height: size.width * .07,
                child: FittedBox(
                  child: SvgWidget(
                    path: icon,
                    fastLoad: true,
                  ),
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: size.width * .03,
                  fontFamily: 'Shabnam',
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * .005),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (sign != null)
                Row(
                  children: [
                    Text(
                      sign!,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: size.width * .0225,
                        fontFamily: 'ShabnamBold',
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: size.width * .02),
                  ],
                ),
              Text(
                AppUtil.replacePersianNumber(value ?? '-'),
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: size.width * .06,
                  fontFamily: 'ShabnamBold',
                  color: Colors.white,
                ),
              ),
            ],
          ),
          if (child != null) Expanded(child: child!),
        ],
      ),
    );
  }
}
