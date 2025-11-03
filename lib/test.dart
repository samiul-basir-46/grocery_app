import 'package:flutter/material.dart';

class ExclusiveProductSection extends StatefulWidget {
  const ExclusiveProductSection({super.key});

  @override
  State<ExclusiveProductSection> createState() =>
      _ExclusiveProductSectionState();
}

class _ExclusiveProductSectionState extends State<ExclusiveProductSection> {
  bool seeAll = false;

  final List<Map<String, dynamic>> exclusiveProducts = [
    {"name": "Banana", "image": "assets/images/banana.png", "price": 40},
    {"name": "Apple", "image": "assets/images/apple.png", "price": 100},
    {"name": "Tomato", "image": "assets/images/tomato.png", "price": 60},
    {"name": "Orange", "image": "assets/images/orange.png", "price": 80},
    {"name": "Mango", "image": "assets/images/mango.png", "price": 120},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Title & See All Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Exclusive Offer",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    seeAll = !seeAll;
                  });
                },
                child: Text(
                  seeAll ? "Show Less" : "See All",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        // 🔹 Horizontal scroll or GridView (toggle)
        AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          transitionBuilder: (child, animation) =>
              SizeTransition(sizeFactor: animation, child: child),
          child: seeAll
              ? Padding(
            key: ValueKey('grid'),
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: exclusiveProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // দুইটা কলাম
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final item = exclusiveProducts[index];
                return productCard(item);
              },
            ),
          )
              : SizedBox(
            key: ValueKey('horizontal'),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: exclusiveProducts.length,
              itemBuilder: (context, index) {
                final item = exclusiveProducts[index];
                return Container(
                  width: 140,
                  margin: EdgeInsets.only(
                    left: 16,
                    right: index == exclusiveProducts.length - 1 ? 16 : 0,
                  ),
                  child: productCard(item),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget productCard(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(item['image'], height: 100),
          Text(item['name'],
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text("৳${item['price']}", style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}
