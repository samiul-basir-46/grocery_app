import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final IconButton? icon;
  final bool isObscure;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.text,
    this.icon,
    required this.isObscure,
    this.controller,
    this.validator,
    this.onChanged,
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
        suffixIcon: icon ?? SizedBox.shrink(),
      ),
    );
  }
}
