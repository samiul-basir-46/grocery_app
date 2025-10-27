import 'package:flutter/material.dart';
import 'package:food_shop/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? color;
  final void Function()? onTap;

  const CustomButton({super.key, required this.title, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsetsGeometry.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: color ?? AppColors.primaryColor,
        ),
        child: Center(
          child: Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }
}
