import 'package:flutter/material.dart';
import 'package:food_shop/model/api_get_model.dart';
import 'package:food_shop/provider/toggle_provider.dart';
import 'package:food_shop/screen/productDetailsScreen/product_details_screen.dart';
import 'package:food_shop/test.dart';
import 'package:food_shop/widgets/custom_product_card.dart';
import 'package:provider/provider.dart';

import '../../../../provider/get_provider.dart';
import '../../../../utils/colors.dart';

class CustomSeeAll extends StatelessWidget {
  final String title;
  final String sectionKey;
  final int startIndex;
  final int endIndex;

  const CustomSeeAll({
    super.key,
    required this.title,
    required this.sectionKey,
    required this.startIndex,
    required this.endIndex,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    final productProvider = Provider.of<GetApiProvider>(context);
    final seeAllProvider = Provider.of<ToggleProvider>(context);

    final seeAll = seeAllProvider.getSeeAll(sectionKey);

    List<ApiGetModel> products = productProvider.products;

    final displayProduct = products.isNotEmpty
        ? products.sublist(startIndex, endIndex.clamp(0, products.length))
        : [];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () => seeAllProvider.toggleSeeAll(sectionKey),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  seeAll ? "See less" : "See all",
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
        productProvider.isLoading
            ? SizedBox(
                height: screenHeight * 0.27,
                child: Center(
                  child: CircularProgressIndicator(color: Colors.black),
                ),
              )
            : AnimatedSwitcher(
                duration: Duration(milliseconds: 400),
                transitionBuilder: (child, animation) =>
                    SizeTransition(sizeFactor: animation, child: child),
                child: seeAll
                    ? GridView.builder(
                        key: ValueKey("$sectionKey-grid"),
                        shrinkWrap: true,
                        primary: false,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 0.75,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 0,
                        ),
                        itemCount: displayProduct.length > 6
                            ? 6
                            : displayProduct.length,
                        itemBuilder: (context, index) {
                          final item = displayProduct[index];
                          return CustomProductCard(
                            itemName: item.name,
                            itemImage: item.image,
                            itemPrice: item.price,
                            category: item.category,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                    productsId:
                                        item.id,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      )
                    : SizedBox(
                        key: ValueKey("$sectionKey-horizontal"),
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          primary: false,
                          itemCount: displayProduct.length > 6
                              ? 6
                              : displayProduct.length,
                          itemBuilder: (context, index) {
                            final item = displayProduct[index];
                            return CustomProductCard(
                              itemName: item.name,
                              itemImage: item.image,
                              itemPrice: item.price,
                              category: item.category,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                      productsId:
                                          item.id,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
              ),
      ],
    );
  }
}
