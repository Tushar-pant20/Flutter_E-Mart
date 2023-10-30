import 'dart:convert';

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/views/Category_screen/category_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: categories.text.fontFamily(bold).white.make(),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getProducts(), // Load the product data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Map<String, dynamic>> products = snapshot.data ?? [];
            return Container(
              padding: EdgeInsets.all(12),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        categoryImages[index],
                        height: 120,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      10.heightBox,
                      categoryList[index]
                          .text
                          .color(darkFontGrey)
                          .align(TextAlign.center)
                          .make(),
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .clip(Clip.antiAlias)
                      .outerShadowSm
                      .make()
                      .onTap(() {
                    Get.to(
                      () => CategoryDetails(
                        title: categoryList[index],
                        products: products,
                      ),
                    );
                  });
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    String jsonString =
        await rootBundle.loadString('assets/jsonfile/products.json');
    List<dynamic> data = json.decode(jsonString);
    List<Map<String, dynamic>> products = List<Map<String, dynamic>>.from(data);
    return products;
  }
}
