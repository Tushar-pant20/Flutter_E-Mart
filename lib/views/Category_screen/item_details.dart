import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/cart_screen/cart.dart';
import 'package:emart_app/views/cart_screen/cart_item.dart';
import 'package:emart_app/views/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  ProductScreen(
      {required this.name, required this.price, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(child: Image.network(imageUrl)),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Product Name: $name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Price: ₹$price',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Spacer(), // Push buttons to the bottom
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement your "Buy Now" functionality here
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        fixedSize: Size(double.infinity, 50)),
                    child: Text('Buy Now'),
                  ),
                ),
                // SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      try {
                        final parsedPrice = double.parse(price);
                        final item = CartItem(name, parsedPrice, imageUrl, 1);
                        shoppingCart.addItem(item);
                      } catch (e) {
                        // Handle the parsing error here, e.g., show an error message or use a default value.
                        print('Error: $e');
                        // You can use a default price, for example:
                        final item = CartItem(name, 0.0, imageUrl, 1);
                        shoppingCart.addItem(item);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(double.infinity, 50)),
                    child: Text('Add to Cart'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
