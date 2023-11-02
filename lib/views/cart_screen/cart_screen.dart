import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/cart_screen/cart.dart';
import 'package:emart_app/views/cart_screen/cart_item.dart';
import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  final Cart cart;

  CartList({required this.cart});

  void removeCartItem(CartItem item) {
    cart.removeItem(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Tushar Store Cart".text.white.fontFamily(bold).make(),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final cartItem = cart.items[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                        cartItem.imageUrl), // Display the image on the left
                    title: Text(cartItem.productName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price: ₹${cartItem.price.toStringAsFixed(2)}'),
                        Text('Quantity: ${cartItem.quantity}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        removeCartItem(cartItem);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Implement your "Checkout" functionality here
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent, // Customize button color
                fixedSize: Size(double.infinity, 50),
              ),
              child: Text('Checkout', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
