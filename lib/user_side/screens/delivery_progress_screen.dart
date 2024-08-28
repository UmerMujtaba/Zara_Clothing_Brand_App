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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TextWidget(
          size: 21,
          text: deliveryInProgress,
          color: Colors.black,
          fontFamily: 'TenorSans',
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
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
