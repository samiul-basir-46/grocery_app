import 'api_get_model.dart';

class CartItem {
  final ApiGetModel product;
  int quantity;
  CartItem({
    required this.product,
    this.quantity = 1
  });

  double get totalPrice => product.price * quantity;

}