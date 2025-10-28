import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final IconButton? icon;
  final bool isObscure;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextField({super.key, required this.text, this.icon, required this.isObscure, this.controller, this.validator,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
