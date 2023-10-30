import 'package:emart_app/consts/consts.dart';
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
                      // Implement your "Add to Cart" functionality here
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
