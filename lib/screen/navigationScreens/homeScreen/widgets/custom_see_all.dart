import 'package:flutter/material.dart';
import 'package:food_shop/provider/toggle_provider.dart';
import 'package:food_shop/screen/navigationScreens/homeScreen/widgets/custom_product_card.dart';
import 'package:provider/provider.dart';

import '../../../../provider/get_provider.dart';
import '../../../../utils/colors.dart';

class CustomSeeAll extends StatelessWidget {
  final String title;
  final String sectionKey;

  const CustomSeeAll({
    super.key,
    required this.title,
    required this.sectionKey,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    final productProvider = Provider.of<GetApiProvider>(context);
    final seeAllProvider = Provider.of<ToggleProvider>(context);
    final seeAll = seeAllProvider.getSeeAll(sectionKey);

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
        AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          transitionBuilder: (child, animation) =>
              SizeTransition(sizeFactor: animation, child: child),
          child: seeAll
              ? GridView.builder(
                  key: ValueKey("$sectionKey-grid"),
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4 / 4.9,
                  ),
                  itemCount: productProvider.products!.length,
                  itemBuilder: (context, index) {
                    final item = productProvider.products![index];
                    return CustomProductCard(
                      itemName: item.name,
                      itemImage: "",
                      itemPrice: item.price.toInt(),
                    );
                  },
                )
              : SizedBox(
                  key: ValueKey("$sectionKey-horizontal"),
                  height: screenHeight * 0.27,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: productProvider.products!.length,
                    itemBuilder: (context, index) {
                      final item = productProvider.products![index];
                      return CustomProductCard(
                        itemName: item.name,
                        itemImage: "",
                        itemPrice: item.price.toInt(),
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}

extension on GetApiProvider {
  operator [](int other) {}
}
