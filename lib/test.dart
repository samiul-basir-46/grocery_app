import 'package:flutter/material.dart';
import 'package:food_shop/provider/get_provider.dart';
import 'package:provider/provider.dart';

class ExclusiveProductPage extends StatefulWidget {
  const ExclusiveProductPage({super.key});

  @override
  State<ExclusiveProductPage> createState() => _ExclusiveProductPageState();
}

class _ExclusiveProductPageState extends State<ExclusiveProductPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetApiProvider>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<GetApiProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text("Grocery Shop")),
      body: getProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : getProvider.errorMessage != null
          ? Center(child: Text(getProvider.errorMessage!))
          : ListView.builder(
        itemCount: getProvider.products.length ?? 0,
        itemBuilder: (context, index) {
          final product = getProvider.products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text("\$${product.price.toString()}"),
            leading: Image.network(product.image),
          );
        },
      ),
    );
  }
}
