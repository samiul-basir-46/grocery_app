import 'package:flutter/material.dart';
import 'package:food_shop/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? color;
  final void Function()? onTap;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.title,
    this.color,
    this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: color ?? AppColors.primaryColor,
        ),
        child: Center(
          child: isLoading
              ? Text(
                  "Please wait...",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              : Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
        ),
      ),
    );
  }
}
