import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final IconButton? icon;
  final bool isObscure;

  const CustomTextField({super.key, required this.text, this.icon, required this.isObscure,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      decoration: InputDecoration(
        label: Text(text),
        suffixIcon: icon ?? SizedBox.shrink(),
      ),
    );
  }
}
