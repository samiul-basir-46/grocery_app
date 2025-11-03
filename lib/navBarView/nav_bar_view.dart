import 'package:flutter/material.dart';
import 'package:food_shop/screen/navigationScreens/accountScreen/account_screen.dart';
import 'package:food_shop/screen/navigationScreens/cartScreen/cart_screen.dart';
import 'package:food_shop/screen/navigationScreens/exploreScreen/explore_screen.dart';
import 'package:food_shop/screen/navigationScreens/favoriteScreen/favorite_screen.dart';
import 'package:food_shop/screen/navigationScreens/homeScreen/home_screen.dart';
import 'package:food_shop/utils/colors.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    ExploreScreen(),
    CartScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          backgroundColor: Colors.white70,
          elevation: 10,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/bottom_images/shop_images.png",
                scale: 2.5,
                color: Colors.black,
              ),
              activeIcon: Image.asset(
                "assets/bottom_images/shop_images.png",
                scale: 2.5,
                color: AppColors.primaryColor,
              ),
              label: "Shop",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/bottom_images/explore_images.png",
                scale: 2.5,
                color: Colors.black,
              ),
              activeIcon: Image.asset(
                "assets/bottom_images/explore_images.png",
                scale: 2.5,
                color: AppColors.primaryColor,
              ),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/bottom_images/cart_images.png",
                scale: 2.5,
                color: Colors.black,
              ),
              activeIcon: Image.asset(
                "assets/bottom_images/cart_images.png",
                scale: 2.5,
                color: AppColors.primaryColor,
              ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/bottom_images/favorite_images.png",
                scale: 2.5,
                color: Colors.black,
              ),
              activeIcon: Image.asset(
                "assets/bottom_images/favorite_images.png",
                scale: 2.5,
                color: AppColors.primaryColor,
              ),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/bottom_images/account_images.png",
                scale: 2.5,
                color: Colors.black,
              ),
              activeIcon: Image.asset(
                "assets/bottom_images/account_images.png",
                scale: 2.5,
                color: AppColors.primaryColor,
              ),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
