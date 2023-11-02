// cart.dart
import 'cart_item.dart';

class Cart {
  List<CartItem> items = [];

  void addItem(CartItem item) {
    items.add(item);
  }

  void removeItem(CartItem item) {
    items.remove(item);
  }

  double getTotalPrice() {
    return items.fold(
        0.0, (total, item) => total + (item.price * item.quantity));
  }
}

// Create an instance of the Cart class
final Cart shoppingCart = Cart();
