import 'package:flutter/material.dart';
import 'package:food_shop/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "My Cart",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              SizedBox(height: size.height * 0.027),
              Divider(color: Color(0xFFE2E2E2)),

              SizedBox(height: size.height * 0.02),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                itemBuilder: (context, index) {
                  // final data = cartProvider.items[index];
                  return ;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
