import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;
  final Color backgroundColor;
  const ProductCard({super.key, required this.title, required this.price, required this.imageUrl, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
          style: Theme.of(context).textTheme.titleMedium,),
          Text(price.toString(),
          style: Theme.of(context).textTheme.bodySmall),
          Center(child: Image.asset(imageUrl, height: 175,))
        ],
      ),
    );
  }
}