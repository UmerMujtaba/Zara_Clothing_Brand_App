import 'package:flutter/material.dart';

import '../components/category_products.dart';

class CetegoryGrid extends StatelessWidget {
  const CetegoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Open',
              style: TextStyle(
                  fontFamily: 'TenorSans', color: Colors.black, fontSize: 22),
            ),
            Text(
              'Fashion',
              style: TextStyle(
                  fontFamily: 'TenorSans', color: Colors.black, fontSize: 24),
            ),
          ],
        ),
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text(
                      '4500 Apparel',
                      style: TextStyle(fontFamily: 'TenorSans'),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.grey, // Background color
                        shape: BoxShape.circle, // Circular shape
                      ),
                      width: 40, // Diameter of the circle (2 * radius)
                      height: 40, // Diameter of the circle (2 * radius)
                      child: const Icon(
                        Icons.list_sharp,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.grey, // Background color
                        shape: BoxShape.circle, // Circular shape
                      ),
                      width: 40, // Diameter of the circle (2 * radius)
                      height: 40, // Diameter of the circle (2 * radius)
                      child: const Icon(
                        Icons.table_rows,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
        SizedBox(
          height: MediaQuery.of(context).size.height, // Ensure grid takes up available space
          child: ProductGrid(),
        ),
          ],
        ),
      ),
    );
  }
}
