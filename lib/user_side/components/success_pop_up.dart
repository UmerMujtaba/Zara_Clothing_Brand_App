import 'package:flutter/material.dart';
import 'dart:math';

import 'package:zara/user_side/screens/homepage.dart';

void showPaymentSuccessDialog(BuildContext context) {
  String paymentId = _generatePaymentId();

  showDialog(
    context: context,
    barrierDismissible: false, // Prevent closing the dialog by tapping outside
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Cross Icon
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Payment Success Heading
              const Text(
                'PAYMENT SUCCESS',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'TenorSans'),
              ),
              const SizedBox(height: 20),

              // Tick Icon
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 60,
              ),
              const SizedBox(height: 20),

              // Payment Done Message
              const Text(
                'Your payment has been done',
                style: TextStyle(fontSize: 18, fontFamily: 'TenorSans'),
              ),
              const SizedBox(height: 10),

              // Payment ID
              Text(
                'Payment ID: $paymentId',
                style: const TextStyle(
                    fontSize: 16, color: Colors.grey, fontFamily: 'TenorSans'),
              ),
              const SizedBox(height: 20),

              // Rate Your Purchase Heading
              const Text(
                'Rate your purchase',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'TenorSans'),
              ),
              const SizedBox(height: 10),

              // Smiley Icons
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.sentiment_very_dissatisfied, size: 36),
                  Icon(Icons.sentiment_neutral, size: 36),
                  Icon(Icons.sentiment_very_satisfied, size: 36),
                ],
              ),
              const SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle submit action
                      Navigator.of(context).pop();
                      Navigator.push(
                        context, // Pass the current context directly
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      ); // Go back to home
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontFamily: 'TenorSans'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.tertiary),
                    child: const Text(
                      'Back to Home',
                      style: TextStyle(fontFamily: 'TenorSans'),
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

String _generatePaymentId() {
  // Generate a random payment ID
  const length = 12;
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final rnd = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}
