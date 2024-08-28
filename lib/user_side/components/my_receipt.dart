import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/cart.dart';


String centerText(String text, int width) {
  int totalPadding = width - text.length;
  int padLeft = (totalPadding / 2).floor();
  int padRight = totalPadding - padLeft;

  return text.padLeft(text.length + padLeft).padRight(width);
}


String generateReceipt(List<CartItem> cartItems) {
  double totalAmount = 0.0;
  int totalItems = 0;

  StringBuffer receipt = StringBuffer()

    ..writeln(centerText("ORDER CONFIRMATION", 40))
    ..writeln()
    ..writeln("🕒 Date & Time: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())}")
    ..writeln()
    ..writeln("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    ..writeln()
    ..writeln("🛒 𝓨𝓸𝓾𝓻 𝓢𝓱𝓸𝓹𝓹𝓲𝓷𝓰 𝓢𝓾𝓶𝓶𝓪𝓻𝔂")
    ..writeln("━━━━━━━━━━━━━━━━━━━━━━━━━━━");

  for (var item in cartItems) {
    totalAmount += item.totalPrice;
    totalItems += item.quantity;

    receipt
      ..writeln("🛍️ ${item.quantity} x ${item.product.name}")
      ..writeln("   - ${_formatPrice(item.product.price)} each")
      ..writeln();
  }

  receipt
    ..writeln("━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    ..writeln("🔢 Total Items: $totalItems")
    ..writeln("💵 Total Price: ${_formatPrice(totalAmount)}")
    ..writeln("━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    ..writeln()
    ..writeln("🙏 𝓣𝓱𝓪𝓷𝓴 𝓨𝓸𝓾 𝓯𝓸𝓻 𝓢𝓱𝓸𝓹𝓹𝓲𝓷𝓰 𝔀𝓲𝓽𝓱 𝓤𝓼!");

  return receipt.toString();
}

String _formatPrice(double price) {
  return "Rs ${price.toStringAsFixed(2)}";
}


class MyReceipt extends ConsumerWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    // Generate receipt
    final receiptContent = generateReceipt(cartItems);

    // Save receipt to Firestore
    saveReceiptToFirestore(
      cartItems: cartItems,
      receiptContent: receiptContent,
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
                receiptContent,
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

  Future<void> saveReceiptToFirestore({
    required List<CartItem> cartItems,
    required String receiptContent,
  }) async {
    final firestore = FirebaseFirestore.instance;
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    final totalAmount = cartItems.fold<double>(
      0.0,
      (previousValue, item) => previousValue + item.totalPrice,
    );
    final totalItems = cartItems.fold<int>(
      0,
      (previousValue, item) => previousValue + item.quantity,
    );

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
