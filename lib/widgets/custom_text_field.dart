import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? text;
  final String? hintText;
  final IconButton? suffixIcon, prefixIcon;
  final bool isObscure,filled;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final InputBorder? enabledBorder, disabledBorder,focusBorder;
  final Color? fillColor;

  const CustomTextField({
    super.key,
    this.text,
    this.suffixIcon,
    this.prefixIcon,
    required this.isObscure,
    this.controller,
    this.validator,
    this.onChanged,
    this.enabledBorder,
    this.disabledBorder, this.fillColor, required this.filled, this.focusBorder, this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      obscureText: isObscure,
      validator: validator,
      decoration: InputDecoration(
        labelText: text,
        hintText: hintText,
        suffixIcon: suffixIcon ?? SizedBox.shrink(),
        prefixIcon: prefixIcon ?? SizedBox.shrink(),
        prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
        enabledBorder: enabledBorder,
        focusedBorder: focusBorder,
        disabledBorder: disabledBorder,
        fillColor: fillColor,
        filled: filled
      ),
    );
  }
}
