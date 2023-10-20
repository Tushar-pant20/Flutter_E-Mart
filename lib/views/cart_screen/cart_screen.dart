import 'package:emart_app/widgets_common/out_buttons.dart';
import 'package:flutter/material.dart';
import 'package:emart_app/consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  // Define a list of product items (you can replace this with your actual data)
  final List<Map<String, dynamic>> cartItems = const [
    {
      'name': 'Women Sandals',
      'price': 20.0,
      'quantity': 2,
      'imagePath': cartItem1,
    },
    {
      'name': 'Bag',
      'price': 15.0,
      'quantity': 1,
      'imagePath': cartItem2,
    },
    {
      'name': 'Football shoes',
      'price': 15.0,
      'quantity': 1,
      'imagePath': cartItem3,
    },
    {
      'name': 'Laptop',
      'price': 15.0,
      'quantity': 1,
      'imagePath': cartItem4,
    },
    {
      'name': 'Sunglasses',
      'price': 15.0,
      'quantity': 1,
      'imagePath': cartItem5,
    },
    {
      'name': 'Laptop',
      'price': 15.0,
      'quantity': 1,
      'imagePath': cartItem6,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        title:
            "T-store Cart".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return ListTile(
                    leading:
                        Image.asset(item['imagePath'], width: 50, height: 50),
                    title: Text(item['name'].toString()),
                    subtitle: Text('Price: \$${item['price']}'),
                    trailing: Text('Quantity: ${item['quantity']}'),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Total Price"
                    .text
                    .fontFamily(semibold)
                    .color(darkFontGrey)
                    .make(),
                "40"
                    .numCurrency
                    .text
                    .fontFamily(semibold)
                    .color(redColor)
                    .make(),
              ],
            ).box.padding(EdgeInsets.all(12)).color(golden).make(),
            5.heightBox,
            SizedBox(
              width: context.screenWidth - 60,
              child: ourButton(
                color: redColor,
                onPress: () {},
                textColor: whiteColor,
                title: "Proceed to Shipping",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
