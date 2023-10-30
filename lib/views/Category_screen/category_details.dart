import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/Category_screen/item_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatefulWidget {
  final String? title;
  final List<Map<String, dynamic>> products;

  CategoryDetails({Key? key, required this.title, required this.products})
      : super(key: key);

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  late List<Map<String, dynamic>> filteredProducts;
  final TextEditingController _searchController = TextEditingController();
  String? selectedSortOption;

  @override
  void initState() {
    super.initState();
    // Initialize the filtered products with products of the selected category
    filteredProducts = widget.products
        .where((product) => product['category'] == widget.title)
        .toList();
    selectedSortOption = 'Low to High'; // Default sorting option
  }

  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        // Show all products of the selected category
        filteredProducts = widget.products
            .where((product) => product['category'] == widget.title)
            .toList();
      } else {
        // Filter products by name within the category
        filteredProducts = widget.products
            .where((product) =>
                product['category'] == widget.title &&
                product['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  double parsePrice(dynamic price) {
    if (price is int) {
      return price.toDouble();
    } else if (price is String) {
      try {
        return double.parse(price);
      } catch (e) {
        return 0.0; // Default value in case of parsing error
      }
    }
    return 0.0; // Default value for unsupported data types
  }

  void _sortProducts(String option) {
    setState(() {
      selectedSortOption = option;
      if (option == 'Low to High') {
        filteredProducts.sort(
            (a, b) => parsePrice(a['price']).compareTo(parsePrice(b['price'])));
      } else if (option == 'High to Low') {
        filteredProducts.sort(
            (a, b) => parsePrice(b['price']).compareTo(parsePrice(a['price'])));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!, style: TextStyle(color: Colors.white)),
        actions: [
          PopupMenuButton(
            onSelected: _sortProducts,
            itemBuilder: (BuildContext context) {
              return ['Low to High', 'High to Low'].map((String option) {
                return PopupMenuItem(value: option, child: Text(option));
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterProducts,
              decoration: InputDecoration(
                labelText: 'Search by Product Name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 80,
                        child: Image.network(product['imageUrl']),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              product['name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\u20B9${product['price']}',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).onTap(() {
                  Get.to(() => ProductScreen(
                      name: product['name'],
                      price: product['price'],
                      imageUrl: product['imageUrl']));
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
