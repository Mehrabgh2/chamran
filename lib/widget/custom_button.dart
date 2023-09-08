import 'package:flutter/material.dart';
import 'package:chamran/util/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.enabled,
    this.isAccent = false,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool enabled;
  final bool isAccent;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = isAccent ? Colors.white : AppTheme.primaryColor;
    return Container(
      width: size.width * .8,
      height: size.height * .07,
      decoration: enabled
          ? BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              gradient: LinearGradient(
                colors: [
                  color,
                  color.withAlpha(150),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: color.withAlpha(150),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: const Offset(0, 0),
                ),
              ],
            )
          : BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              gradient: LinearGradient(
                colors: [
                  color.withAlpha(100),
                  color.withAlpha(50),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 136, 136, 136).withAlpha(150),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: isAccent ? AppTheme.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              width: isAccent ? 2 : 0,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'ShabnamBold',
            fontSize: size.width * .035,
            fontWeight: FontWeight.bold,
            color: isAccent ? AppTheme.primaryColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
