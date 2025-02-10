import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/global_variables.dart';

import '../widgets/product_card.dart';
import 'product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = ["All", "Adidas", "Nike", "Bata"];
  late String selectedFilter;

  final customBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)));
  
  @override
  void initState() {
    selectedFilter = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Shoes \nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: customBorder,
                      enabledBorder: customBorder,
                      focusedBorder: customBorder),
                ),
              )
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                        selectedFilter = filters[index];
                      },
                      child: Chip(
                          labelStyle: TextStyle(
                            fontSize: 16,
                          ),
                          label: Text(filters[index]),
                          backgroundColor: selectedFilter == filters[index]
                              ? Theme.of(context).colorScheme.primary
                              : Color.fromRGBO(245, 247, 249, 1),
                          side: BorderSide(
                            color: Color.fromRGBO(245, 247, 249, 1),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ProductDetailsPage(product: product);
                      }));
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      imageUrl: product['imageUrl'] as String,
                      backgroundColor: index.isEven
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : Color.fromRGBO(245, 247, 249, 1),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
