import 'package:flutter/material.dart';
import 'package:chamran/util/app_theme.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.controller,
    this.hintText = '',
    this.isPassword = false,
    this.isNext = true,
    this.textAlign = TextAlign.right,
    this.onChanged,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final bool isNext;
  final TextAlign textAlign;
  final Function(String)? onChanged;

  @override
  State<StatefulWidget> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool isValid = true;
  late bool isPasswordShown = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        width: size.width * .8,
        height: size.height * .08,
        child: TextFormField(
          controller: widget.controller,
          onTap: () {
            if (widget.controller.selection ==
                TextSelection.fromPosition(
                    TextPosition(offset: widget.controller.text.length - 1))) {
              widget.controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.controller.text.length));
            }
          },
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom / 2),
          textInputAction:
              widget.isNext ? TextInputAction.next : TextInputAction.done,
          maxLines: 1,
          obscureText: isPasswordShown,
          style: TextStyle(
            fontFamily: 'ShabnamBold',
            fontSize: size.width * .0375,
            color: AppTheme.textfieldText,
          ),
          textDirection: TextDirection.ltr,
          textAlign: widget.textAlign,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? Material(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      child: isPasswordShown
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_outlined),
                      onTap: () {
                        setState(() {
                          isPasswordShown = !isPasswordShown;
                        });
                      },
                    ),
                  )
                : null,
            errorStyle: const TextStyle(fontSize: 0),
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(
              size.height * .04,
              size.height * .04,
              size.height * .04 / 2,
              0,
            ),
            errorBorder: _getEmptyBorder(),
            enabledBorder: _getEmptyBorder(),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  const BorderSide(color: AppTheme.primaryColor, width: 1),
            ),
            border: _getEmptyBorder(),
            disabledBorder: _getEmptyBorder(),
            focusedErrorBorder: _getEmptyBorder(),
            hintTextDirection: TextDirection.ltr,
            labelStyle: TextStyle(
              fontFamily: 'ShabnamBold',
              fontSize: size.width * .0325,
              color: AppTheme.textfieldHint,
            ),
            labelText: widget.hintText,
            floatingLabelStyle: TextStyle(
              fontFamily: 'ShabnamBold',
              fontSize: size.width * .0325,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  InputBorder _getEmptyBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: AppTheme.textfieldText, width: 1),
    );
  }
}
