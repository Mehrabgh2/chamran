import 'package:chamran/widget/svg_widget.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  const CustomBottomNavigationItem({
    required this.icon,
    required this.selected,
    required this.onPressed,
    super.key,
  });
  final String icon;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * .02),
      decoration: BoxDecoration(
        color: selected ? Colors.white.withOpacity(.05) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      height: size.height * .07,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onPressed,
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 125),
            padding: EdgeInsets.all(
                selected ? size.height * .0175 : size.height * .0225),
            child: SvgWidget(
              path: icon,
              fastLoad: true,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
