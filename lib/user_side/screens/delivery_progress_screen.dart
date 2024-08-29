import 'package:flutter/material.dart';
import 'package:zara/user_side/components/textss.dart';

import '../components/constants.dart';
import '../components/my_receipt.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({
    super.key,
  });

  get size => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: TextWidget(
          size: 21,
          text: deliveryInProgress,
          color: Theme.of(context).colorScheme.inversePrimary,
          fontFamily: 'TenorSans',
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }
}
