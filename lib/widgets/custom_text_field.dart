import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final IconButton? suffixIcon, prefixIcon;
  final bool isObscure,filled;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final InputBorder? enabledBorder, disabledBorder;
  final Color? fillColor;

  const CustomTextField({
    super.key,
    required this.text,
    this.suffixIcon,
    this.prefixIcon,
    required this.isObscure,
    this.controller,
    this.validator,
    this.onChanged,
    this.enabledBorder,
    this.disabledBorder, this.fillColor, required this.filled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      obscureText: isObscure,
      validator: validator,
      decoration: InputDecoration(
        label: Text(text),
        suffixIcon: suffixIcon ?? SizedBox.shrink(),
        prefixIcon: prefixIcon ?? SizedBox.shrink(),
        prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
        enabledBorder: enabledBorder,
        disabledBorder: disabledBorder,
        fillColor: fillColor,
        filled: filled
      ),
    );
  }
}
