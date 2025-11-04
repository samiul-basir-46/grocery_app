import 'package:flutter/material.dart';
import 'package:food_shop/provider/auth_provider.dart';
import 'package:food_shop/screen/navigationScreens/homeScreen/widgets/custom_carousel.dart';
import 'package:food_shop/screen/navigationScreens/homeScreen/widgets/custom_see_all.dart';
import 'package:food_shop/services/location_services.dart';
import 'package:food_shop/utils/colors.dart';
import 'package:food_shop/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../../provider/get_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetApiProvider>(
        context,
        listen: false,
      ).fetchProducts();
    });
    final locationProvider = Provider.of<LocationServices>(context);
    final authProvider = Provider.of<ApiProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/carrot_images.png", scale: 3.5),
              Consumer<LocationServices>(
                builder: (context, value, child) {
                  return TextButton.icon(
                    onPressed: () {},
                    label: locationProvider.isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          )
                        : Text(
                            "${locationProvider.address}" ??
                                "Fetching Location",
                            style: TextStyle(
                              color: Color(0xFF393636),
                              fontSize: 18,
                            ),
                          ),
                    icon: Icon(
                      Icons.location_on,
                      size: 25,
                      color: Color(0xFF393636),
                    ),
                  );
                },
              ),

              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                  filled: true,
                  text: "Search Store",
                  isObscure: false,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xFFf2f3f2),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomCarousel(),
              SizedBox(height: screenHeight * 0.03),
              CustomSeeAll(title: "Exclusive Offers", sectionKey: 'exclusive'),
              CustomSeeAll(title: "Best Selling", sectionKey: 'bestSelling'),
              CustomSeeAll(title: "Groceries", sectionKey: 'groceries'),
            ],
          ),
        ),
      ),
    );
  }
}
