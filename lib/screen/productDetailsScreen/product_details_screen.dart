import 'package:flutter/material.dart';
import 'package:food_shop/provider/get_provider.dart';
import 'package:food_shop/provider/single_product_provider.dart';
import 'package:food_shop/provider/toggle_provider.dart';
import 'package:food_shop/utils/colors.dart';
import 'package:food_shop/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productsId;

  const ProductDetailsScreen({super.key, required this.productsId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    final singleProvider = Provider.of<SingleProductProvider>(
      context,
      listen: false,
    );
    singleProvider.fetchSingleProduct(widget.productsId);
  }

  @override
  Widget build(BuildContext context) {
    final toggleProvider = Provider.of<ToggleProvider>(context);

    final singleProvider = Provider.of<SingleProductProvider>(context);
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: Consumer(
        builder: (context, productProvider, child) {
          final product = singleProvider.singleProduct;
          if (singleProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (product == null) {
            return Center(child: Text("No product found"));
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F3F2),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/profile/forward.png",
                              height: 23,
                              width: 23,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),
                      Image.network(
                        product.image,
                        height: isLandscape
                            ? size.height * 0.4
                            : size.height * 0.26,
                        width: isLandscape
                            ? size.height * 0.6
                            : size.height * 0.3,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: isLandscape
                            ? size.height * 0.09
                            : size.height * 0.04,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isLandscape
                                  ? size.height * 0.06
                                  : size.height * 0.024,
                            ),
                          ),
                          InkWell(
                            child: Icon(
                              Icons.favorite_border,
                              size: isLandscape
                                  ? size.height * 0.07
                                  : size.height * 0.033,
                            ),
                          ),
                        ],
                      ),
                      Text("Instock", style: TextStyle(color: Colors.grey)),
                      SizedBox(height: size.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.remove, size: 35, color: Colors.grey),
                              SizedBox(width: 10),
                              Container(
                                width: 40,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Center(child: Text("1")),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.add_rounded,
                                size: 35,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                          Text(
                            "\$${product.price}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),
                      Divider(color: Color(0xFFE2E2E2)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Product Details",
                            style: TextStyle(
                              fontSize: isLandscape
                                  ? size.height * 0.045
                                  : size.height * 0.022,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              toggleProvider.toggleExpand();
                            },
                            icon: toggleProvider.isExpanded
                                ? Icon(Icons.keyboard_arrow_up, size: 30)
                                : Icon(Icons.keyboard_arrow_down, size: 30),
                          ),
                        ],
                      ),
                      AnimatedCrossFade(
                        firstChild: SizedBox.shrink(),
                        secondChild: Text(product.description),
                        crossFadeState: toggleProvider.isExpanded
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: Duration(milliseconds: 300),
                      ),
                      Divider(color: Color(0xFFE2E2E2)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nutrition",
                            style: TextStyle(
                              fontSize: isLandscape
                                  ? size.height * 0.045
                                  : size.height * 0.022,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              toggleProvider.toggleExpand2();
                            },
                            icon: toggleProvider.isExpanded2
                                ? Icon(Icons.keyboard_arrow_up, size: 30)
                                : Icon(Icons.keyboard_arrow_down, size: 30),
                          ),
                        ],
                      ),
                      AnimatedCrossFade(
                        firstChild: SizedBox.shrink(),
                        secondChild: Text(product.description),
                        crossFadeState: toggleProvider.isExpanded2
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: Duration(milliseconds: 300),
                      ),
                      Divider(color: Color(0xFFE2E2E2)),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ratings",
                            style: TextStyle(
                              fontSize: isLandscape
                                  ? size.height * 0.045
                                  : size.height * 0.022,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 20),
                              Icon(Icons.star, color: Colors.orange, size: 20),
                              Icon(Icons.star, color: Colors.orange, size: 20),
                              Icon(Icons.star, color: Colors.orange, size: 20),
                              Icon(Icons.star, color: Colors.orange, size: 20),
                              Text(
                                "(4.5)",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),
                      CustomButton(title: "Add to Basket", isLoading: false),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
