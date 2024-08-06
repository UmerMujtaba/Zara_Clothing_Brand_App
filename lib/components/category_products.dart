import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../screens/product_page.dart';


class ProductGrid extends StatelessWidget {
  final List<Product> products;

  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {


    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two containers per row
        crossAxisSpacing: 8.0, // Spacing between columns
        mainAxisSpacing: 8.0, // Spacing between rows
        childAspectRatio: 0.7, // Adjust the aspect ratio as needed
      ),
      itemCount: products.length, // Total number of items
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(
                builder: (context) => ProductPage()));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.white, // Background color
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // Shadow position
                ),
              ],
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image(
                      image: AssetImage(product.image), // Use product image
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Positioned(
                      bottom: 8, // Positioned from the bottom
                      right: 8, // Positioned from the right
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                      child: Text(
                        product.tag, // Use product tag
                        style: const TextStyle(
                            fontFamily: 'TenorSans', fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                      child: Text(
                        product.name, // Use product name
                        style: const TextStyle(fontFamily: 'TenorSans'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                      child: Text(
                        product.price, // Use product price
                        style: const TextStyle(
                            fontFamily: 'TenorSans', color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


