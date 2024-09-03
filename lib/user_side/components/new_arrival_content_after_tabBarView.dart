import 'package:flutter/material.dart';
import 'package:zara/user_side/components/textss.dart';

import 'image_text_stack.dart';

class New_arrival_content_after_tabBarView extends StatelessWidget {
  const New_arrival_content_after_tabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        TextWidget(
          size: 22,
          text: 'FOLLOW US',
          color: Theme.of(context).colorScheme.inversePrimary,
          letterSpacing: 2,
          fontFamily: 'TenorSans',
        ),
        const SizedBox(height: 10.0),
        Image(
          // ignore: prefer_const_constructors
          image: AssetImage('assets/images/instagram.png'),
          height: 30,
          width: 30,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        const SizedBox(height: 20),
        const Column(
          children: [
            ImageTextStack(
              imagePath: 'assets/images/5.jpg',
              text: '@mia',
              imagePath2: 'assets/images/6.jpg',
              text2: '@_john',
            ),
            ImageTextStack(
              imagePath: 'assets/images/7.jpg',
              text: '@mia',
              imagePath2: 'assets/images/8.jpg',
              text2: '@_john',
            ),
          ],
        ),
      ],
    );
  }
}
