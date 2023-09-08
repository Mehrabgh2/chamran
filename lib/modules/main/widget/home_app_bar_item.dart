import 'package:chamran/util/app_util.dart';
import 'package:chamran/widget/svg_widget.dart';
import 'package:flutter/material.dart';

class HomeAppBarItem extends StatelessWidget {
  const HomeAppBarItem({
    required this.icon,
    required this.value,
    super.key,
  });
  final String icon;
  final num? value;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppUtil.replacePersianNumber(value != null ? '$value%' : '-'),
          style: TextStyle(
            fontFamily: 'Shabnam',
            fontSize: size.width * .03,
            color: Colors.white,
          ),
        ),
        SizedBox(width: size.width * .01),
        SizedBox(
          width: size.height * .016,
          height: size.height * .016,
          child: FittedBox(
            child: SvgWidget(
              path: icon,
              fastLoad: true,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ],
    );
  }
}
