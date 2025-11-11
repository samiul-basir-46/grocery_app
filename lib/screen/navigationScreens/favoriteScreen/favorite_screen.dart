import 'package:flutter/material.dart';
import 'package:food_shop/widgets/custom_button.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(

      appBar: AppBar(
        title: Text("Favorite",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 10),
          child: Divider(color: Color(0xFFE2E2E2)),
        ),
        elevation: 0,
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    "https://robohash.org/103.72.212.48.png",
                                    height: 60,
                                    width: 60,
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Sprite Can",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text("Sprite Can"),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("\$1.59"),
                                  SizedBox(width: 10),
                                  Icon(Icons.arrow_forward_ios_rounded),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Color(0xFFE2E2E2)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(title: "Add all to cart", isLoading: false),
            ),
          ],
        ),
      ),
    );
  }
}
