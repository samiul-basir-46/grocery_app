import 'package:flutter/material.dart';
import 'package:food_shop/model/api_get_model.dart';
import 'package:food_shop/provider/get_provider.dart';
import 'package:food_shop/utils/colors.dart';
import 'package:provider/provider.dart';

class CustomProductCard extends StatelessWidget {

  final String itemName;
  final int itemPrice;
  final String itemImage;

  const CustomProductCard({super.key, required this.itemName, required this.itemPrice, required this.itemImage});

  @override
  Widget build(BuildContext context) {


    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.40,
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.018),
          Align(
            alignment: Alignment.center,
            child: Image.network(
              itemImage,
              width: screenWidth * 0.18,
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          Text(
            itemName,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text("7pcs, Price"),
          SizedBox(height: screenHeight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$$itemName", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: AppColors.primaryColor,borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
