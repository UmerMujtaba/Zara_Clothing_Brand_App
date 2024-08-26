import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zara/user_side/components/textss.dart';

import 'image_text_stack.dart';

class New_arrival_content_after_tabBarView extends ConsumerWidget {
  const New_arrival_content_after_tabBarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        TextWidget(
            size: 22, text: 'FOLLOW US', color: Colors.black, letterSpacing: 2),
        const SizedBox(height: 10.0),
        const Image(
          image: AssetImage('lib/images/instagram.png'),
          height: 30,
          width: 30,
        ),
        const SizedBox(height: 20),
        const Column(
          children: [
            ImageTextStack(
              imagePath: 'lib/images/5.jpg',
              text: '@mia',
              imagePath2: 'lib/images/6.jpg',
              text2: '@_john',
            ),
            ImageTextStack(
              imagePath: 'lib/images/7.jpg',
              text: '@mia',
              imagePath2: 'lib/images/8.jpg',
              text2: '@_john',
            ),
          ],
        ),
      ],
    );
  }
}
