import 'package:flutter/material.dart';
import 'package:food_shop/provider/single_product_provider.dart';
import 'package:food_shop/provider/toggle_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen2 extends StatefulWidget {
  final int productsId;
  const ProductDetailsScreen2({super.key, required this.productsId});

  @override
  State<ProductDetailsScreen2> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen2> {
  @override
  void initState() {
    super.initState();
    // Provider fetch call
    final singleProvider = Provider.of<SingleProductProvider>(context, listen: false);
    singleProvider.fetchSingleProduct(widget.productsId);
  }

  @override
  Widget build(BuildContext context) {
    final toggleProvider = Provider.of<ToggleProvider>(context);
    final size = MediaQuery.of(context).size;
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: Consumer<SingleProductProvider>(
        builder: (context, singleProvider, child) {
          final product = singleProvider.singleProduct;
          if (singleProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (product == null) {
            return Center(child: Text("No product found"));
          }
          // এখন UI product দেখাবে
          return SingleChildScrollView(
            child: Column(
              children: [
                Image.network(product.image),
                Text(product.name),
                Text("\$${product.price}"),
                Text(product.description),
              ],
            ),
          );
        },
      ),
    );
  }
}
