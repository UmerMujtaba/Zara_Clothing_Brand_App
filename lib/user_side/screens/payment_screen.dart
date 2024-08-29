import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/cart.dart';
import '../components/button.dart';
import '../components/constants.dart';
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

  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvcCode = "";
  bool isCvcFocused = false;

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: TextWidget(
            size: 22,
            text: checkOut,
            color: Theme.of(context).colorScheme.inversePrimary,
            fontFamily: 'TenorSans',
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
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
              text: payNow,
              onTap: () async {
                userTappedPay(ref);
              },
            ),
            const SizedBox(height: 25),
          ],
        ),
      );
    });
  }
}