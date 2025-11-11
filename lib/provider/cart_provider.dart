import 'package:food_shop/model/api_get_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../model/cart_item.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];
  final box = GetStorage();

  CartProvider() {
    loadCart();
  }

  List<CartItem> get items => _items;

  void loadCart() {
    final stored = box.read<List>('cart') ?? [];
    _items = stored
        .map(
          (e) => CartItem(
            product: ApiGetModel(
              category: e['category'] ?? '',
              id: e['id'],
              name: e['name'],
              description: e['description'] ?? '',
              price: e['price']?.toDouble() ?? 0.0,
              image:
                  e['images'] ??
                  'https://imgs.search.brave.com/3RRuhsHHs_2piH7Skyb8Li_sT9w1SZJahNwcu5Mx6cc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/dmVjdG9yc3RvY2su/Y29tL2kvNTAwcC8w/Ny83MC9pbWFnZS1u/b3QtYW4tYXZhaWxh/YmxlLWljb24tdmVj/dG9yLTUzMTEwNzcw/LmpwZw',
            ),
            quantity: e['quantity'] ?? 1,
          ),
        )
        .toList();
    notifyListeners();
  }

  void saveCart() {
    final data = _items
        .map(
          (e) => {
            'id': e.product.id,
            'name': e.product.name,
            'description': e.product.description,
            'price': e.product.price,
            'image': e.product.image,
            'category': e.product.category,
            'quantity': e.quantity,
          },
        )
        .toList();

    box.write('cart', data);
  }

  double get totalAmount {
    double total = 0;
    for (var item in _items) {
      total += item.totalPrice;
    }
    return total;
  }

  bool isInCart(ApiGetModel products) {
    return _items.any((item) => item.product.id == products.id);
  }

  int getQuantity(ApiGetModel products) {
    final item = _items.firstWhere(
      (item) => item.product.id == products.id,
      orElse: () => CartItem(product: products, quantity: 0),
    );
    return item.quantity;
  }

  void addToCart(ApiGetModel products, {int quantity = 1}) {
    final index = _items.indexWhere((item) => item.product.id == products.id);

    if (index >= 0) {
      _items[index].quantity += quantity;
    } else {
      _items.add(CartItem(product: products, quantity: quantity));
    }
    notifyListeners();
  }

  void increaseQuantity(ApiGetModel products) {
    final index = _items.indexWhere((item) => item.product.id == products.id);

    if (index >= 0) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(ApiGetModel products) {
    final index = _items.indexWhere((item) => item.product.id == products.id);
    if (index >= 0) {
      _items[index].quantity--;
      if (index <= 0) {
        _items.removeAt(index);
      }
    }
    notifyListeners();
  }

  void removeItem(ApiGetModel products) {
    _items.removeWhere((item) => item.product.id == products.id);
    notifyListeners();
  }
}

class FavoriteProvider with ChangeNotifier {
  List<CartItem> _items = [];
  final box = GetStorage();

  FavoriteProvider() {
    loadFavorites();
  }

  List<CartItem> get items => _items;

  bool isInFavorite(ApiGetModel product) {
    return _items.any((item) => item.product.id == product.id);
  }

  void addToFav(ApiGetModel product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items.removeAt(index);
    } else {
      _items.add(CartItem(product: product));
    }
    saveFavorite();
    notifyListeners();
  }

  void saveFavorite() {
    final favData = _items
        .map(
          (item) => {
            'id': item.product.id,
            'name': item.product.name,
            'description': item.product.description,
            'price': item.product.price,
            'category': item.product.category,
            'images': item.product.image,
          },
        )
        .toList();
    box.write('favorites', favData);
  }

  void loadFavorites() {
    final favData = box.read('favorites');
    if (favData != null) {
      _items = List<Map<String, dynamic>>.from(favData)
          .map(
            (item) => CartItem(
              product: ApiGetModel(
                category: item['category'],
                id: item['id'],
                name: item['name'],
                description: item['description'] ?? '',
                price: (item['price'] as num).toDouble(),
                image: item['images'],
              ),
            ),
          )
          .toList();
    }
    notifyListeners();
  }

  void addAllToCart(CartProvider cartProvider) {
    for (var item in _items) {
      cartProvider.addToCart(item.product);
    }
  }
}
