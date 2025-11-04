import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String image;
  final String title;
  final IconData icon;
  final double? height;

  const CustomListTile({
    super.key,
    required this.image,
    required this.title,
    required this.icon, this.height,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
      leading: Image.asset(image, height: height ?? 27),
      minLeadingWidth: screenWidth * 0.09,
      trailing: Icon(icon),
    );
  }
}
