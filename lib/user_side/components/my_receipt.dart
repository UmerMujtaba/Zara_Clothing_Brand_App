import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/cart.dart';

class MyReceipt extends ConsumerWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    // Compute receipt data
    double totalAmount = 0.0;
    int totalItems = 0;

    StringBuffer receipt = StringBuffer()
      ..writeln("Here's your receipt.")
      ..writeln()
      ..writeln(DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()))
      ..writeln()
      ..writeln("--------------------------------------------");

    for (var item in cartItems) {
      totalAmount += item.totalPrice;
      totalItems += item.quantity;

      receipt.writeln("${item.quantity} X ${item.product.name} - ${_formatPrice(item.product.price)}");

      receipt.writeln();
    }

    receipt
      ..writeln("-------------------------------------------")
      ..writeln()
      ..writeln("Total Items: $totalItems")
      ..writeln("Total Price: ${_formatPrice(totalAmount)}");

    // Save receipt to Firestore
    saveReceiptToFirestore(
      cartItems: cartItems,
      totalAmount: totalAmount,
      totalItems: totalItems,
    );

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Here's your receipt.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              child: Text(
                receipt.toString(),
                style: const TextStyle(
                  fontFamily: 'TenorSans',
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Estimated Delivery time is 4:10 PM',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  String _formatPrice(double price) {
    return "${price.toStringAsFixed(2)}";
  }



  Future<void> saveReceiptToFirestore({
    required List<CartItem> cartItems,
    required double totalAmount,
    required int totalItems,
  }) async {
    final firestore = FirebaseFirestore.instance;
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    // Prepare receipt data
    final receiptData = {
      'date': formattedDate,
      'totalItems': totalItems,
      'totalAmount': totalAmount,
      'items': cartItems.map((item) {
        return {
          'name': item.product.name,
          'quantity': item.quantity,
          'price': item.product.price,

        };
      }).toList(),
    };

    try {
      // Save receipt data to Firestore
      await firestore.collection('receipts').add(receiptData);
      print('Receipt saved successfully!');
    } catch (e) {
      print('Failed to save receipt: $e');
    }
  }
}
