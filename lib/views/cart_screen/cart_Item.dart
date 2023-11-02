// cart_item.dart
class CartItem {
  final String productName;
  final double price;
  final String imageUrl; // Add the image URL
  int quantity;

  CartItem(this.productName, this.price, this.imageUrl, this.quantity);
}
