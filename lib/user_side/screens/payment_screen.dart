import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:zara/model/card.dart';
import 'package:zara/user_side/components/app_bar.dart';
import 'package:zara/user_side/components/drawer.dart';
import '../../model/cart.dart';
import '../../providers/providers.dart';
import '../components/button.dart';
import '../components/line.dart';
import '../components/my_receipt.dart';
import '../components/textss.dart';
import 'delivery_progress_screen.dart';

class PaymentPage extends ConsumerStatefulWidget {
  const PaymentPage({super.key});

  @override
  ConsumerState<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends ConsumerState<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String id = const Uuid().v4();
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvcCode = "";
  bool isCvcFocused = false;

  Future<void> saveCardDetails({
    required String cardNumber,
    required String expiryDate,
    required String cardHolderName,
    required String cvcCode,
    required String userId, // Pass the user's ID
  }) async {
    try {
      // Encrypt the CVC code (implement your encryption logic)
      String encryptedCvc = encryptCvc(cvcCode);

      // Create a new card model
      CardModel card = CardModel(
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        cardHolderName: cardHolderName,
        cvc: encryptedCvc,
      );

      // Reference to the user's document in Firestore
      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      // Update the user's document with the new card details
      await userDocRef.update({
        'card': FieldValue.arrayUnion([card.toMap()]),
        // Add the card details to the existing list
      });
    } catch (e) {
      // Handle any errors
      print('Error saving card details: $e');
    }
  }

// Function to encrypt CVC (example, implement your own encryption)
  String encryptCvc(String cvc) {
    // Implement your encryption logic here
    // For demonstration purposes, this just returns the same CVC
    return cvc;
  }

  Future<String?> getEmailFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    if (email == null) {
      // Handle the null case, perhaps show an error or prompt the user to log in
      print("No email found in SharedPreferences.");
    }
    return email;
  }

  Future<void> sendEmail(BuildContext context, String receiptContent) async {
    String username = 'zaraclothingstore0@gmail.com';
    String password = 'vnmzsmltxlgbdjid';

    final smtpServer = gmail(username, password);
    String? userEmail = await getEmailFromSharedPreferences();

    final message = Message()
      ..from = Address(username, 'Zara')
      ..recipients.add(userEmail)
      ..subject = 'Your Order Receipt'
      ..text = 'Thank you for your purchase!\n\n$receiptContent';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Mail Sent Successfully")),
      );
    } on MailerException catch (e) {
      print('Message not sent.');
      print(e.message);
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
    print("User Email: $userEmail");
  }

  void userTappedPay(WidgetRef ref) {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirm Payment'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Card Number: $cardNumber'),
                Text('Expiry Date: $expiryDate'),
                Text('Card Holder Name: $cardHolderName'),
                Text('CVC: $cvcCode'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);

                // Navigate to the Delivery Progress Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeliveryProgressPage(),
                  ),
                );

                // Fetch the cart items and generate the receipt content
                final cartItems = ref.read(cartProvider);
                final receiptContent = generateReceipt(cartItems);

                // Send the receipt via email
                await sendEmail(context, receiptContent);
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: const myAppbar(),
        drawer: const MyTabbedDrawer(),
        body: Column(
          children: [
            const Gap(20),
            TextWidget(
              size: 24,
              text: 'PAYMENT METHOD',
              color: Theme.of(context).colorScheme.inversePrimary,
              fontFamily: 'TenorSans',
            ),
            CustomPaint(
              size: const Size(200, 50), // Adjust size as needed
              painter: LineWithDiamondPainter(
                lineColor: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const Gap(20),
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvcCode,
              showBackView: isCvcFocused,
              onCreditCardWidgetChange: (p0) {},
            ),
            CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvcCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvcCode = data.cvvCode;
                });
              },
              formKey: formKey,
            ),
            const Spacer(),
            MyButton(
              text: 'ADD CARD',
              onTap: () {
                final user = ref.read(userProvider).maybeWhen(
                      data: (user) => user,
                      orElse: () => null,
                    );

                if (user != null) {
                  // Save card details and show dialog after completion
                  saveCardDetails(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvcCode: cvcCode,
                    userId: user.id!, // Pass the user's ID
                  ).then((_) {
                    // Show a confirmation dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Card Added Successfully"),
                          content: const Text(
                              "Your card has been added successfully."),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                                Navigator.of(context)
                                    .pop(); // Pop the current screen
                              },
                            ),
                          ],
                        );
                      },
                    );
                  });
                } else {
                  // Handle case where user is not found or not logged in
                  print("User not found");
                }

                //userTappedPay(ref);
              },
            ),
            const SizedBox(height: 25),
          ],
        ),
      );
    });
  }
}
