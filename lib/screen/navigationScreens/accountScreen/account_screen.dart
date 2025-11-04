import 'package:flutter/material.dart';
import 'package:food_shop/provider/auth_provider.dart';
import 'package:food_shop/provider/get_provider.dart';
import 'package:food_shop/screen/loginScreen/login_screen.dart';
import 'package:food_shop/screen/navigationScreens/accountScreen/widget/custom_list_tile.dart';
import 'package:food_shop/utils/colors.dart';
import 'package:food_shop/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final profileProvider = Provider.of<GetApiProvider>(context, listen: false);
    profileProvider.loadSavedProfile();
    profileProvider.fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<GetApiProvider>(context);
    final authProvider = Provider.of<ApiProvider>(context);

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  profileProvider.isLoading
                      ? ListTile(
                          title: Text(
                            ("......."),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text("......."),
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFF2F3F2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )
                      : ListTile(
                          title: Text(
                            profileProvider.profileName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(profileProvider.profileEmail),
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFF2F3F2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                  SizedBox(height: screenHeight * 0.01),
                  Divider(color: Color(0xFFE2E2E2)),
                  CustomListTile(
                    image: "assets/profile/orders_icon.png",
                    title: "Orders",
                    icon: Icons.arrow_forward_ios_outlined,
                  ),
                  Divider(color: Color(0xFFE2E2E2)),
                  CustomListTile(
                    image: "assets/profile/details_icon.png",
                    title: "My Details",
                    height: 21,
                    icon: Icons.arrow_forward_ios_outlined,
                  ),
                  Divider(color: Color(0xFFE2E2E2)),
                  CustomListTile(
                    image: "assets/profile/location_icon.png",
                    title: "Delivery Address",
                    icon: Icons.arrow_forward_ios_outlined,
                  ),
                  Divider(color: Color(0xFFE2E2E2)),
                  CustomListTile(
                    image: "assets/profile/payment_icon.png",
                    title: "Payment Method",
                    height: 20,
                    icon: Icons.arrow_forward_ios_outlined,
                  ),
                  Divider(color: Color(0xFFE2E2E2)),
                  CustomListTile(
                    image: "assets/profile/promo_icon.png",
                    title: "Promo Code",
                    icon: Icons.arrow_forward_ios_outlined,
                  ),
                  Divider(color: Color(0xFFE2E2E2)),
                  CustomListTile(
                    image: "assets/profile/notification_icon.png",
                    title: "Notifications",
                    icon: Icons.arrow_forward_ios_outlined,
                  ),
                  Divider(color: Color(0xFFE2E2E2)),
                  CustomListTile(
                    image: "assets/profile/help_icon.png",
                    title: "Help",
                    icon: Icons.arrow_forward_ios_outlined,
                  ),
                  Divider(color: Color(0xFFE2E2E2)),
                  CustomListTile(
                    image: "assets/profile/about_icon.png",
                    title: "About",
                    icon: Icons.arrow_forward_ios_outlined,
                  ),
                  Divider(color: Color(0xFFE2E2E2)),
                ],
              ),
              SizedBox(height: screenHeight * 0.07),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: screenHeight * 0.07,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFFF2F3F2),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                      ),
                      onPressed: () {
                        authProvider.logOut();
                        profileProvider.profileLogOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.exit_to_app,
                              color: AppColors.primaryColor,
                              size: 30,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Log Out",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
