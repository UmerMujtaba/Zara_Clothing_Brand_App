import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Grid')),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two containers per row
          crossAxisSpacing: 8.0, // Spacing between columns
          mainAxisSpacing: 8.0, // Spacing between rows
          childAspectRatio: 0.7, // Adjust the aspect ratio as needed
        ),
        itemCount: 20, // Total number of items
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white, // Background color
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // Shadow position
                ),
              ],
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image(
                      image: AssetImage(
                        'lib/images/category/1.jpg', // Image source
                      ),
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 8, // Positioned from the bottom
                      right: 8, // Positioned from the right
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  '21WN',
                  style: TextStyle(
                      fontFamily: 'TenorSans', fontWeight: FontWeight.w500),
                ),
                Text('ok'),
                Text('ok'),
                Text('ok'),
              ],
            ),
          );
        },
      ),
    );
  }
}
