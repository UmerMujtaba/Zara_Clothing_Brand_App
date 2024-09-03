import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/product.dart';
import '../screens/product_page.dart';

class ItemContainer extends ConsumerWidget {
  final Product item;

  const ItemContainer({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product: item),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Theme.of(context).colorScheme.secondary,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              item.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250, // Adjust height as needed
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.name,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'TenorSans',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Rs ${item.price.toString()}',
                style: const TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 14,
                  fontFamily: 'TenorSans',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
