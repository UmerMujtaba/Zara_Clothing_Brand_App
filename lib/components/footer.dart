import 'package:flutter/material.dart';

import '../screens/blog_list.dart';
import 'line.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage('lib/images/twitter.png'),
              height: 20,
              width: 20,
            ),
            Image(
              image: AssetImage('lib/images/instagram1.png'),
              height: 20,
              width: 20,
            ),
            Image(
              image: AssetImage('lib/images/youtube.png'),
              height: 20,
              width: 20,
            ),
          ],
        ),
        CustomPaint(
          size: const Size(300, 50), // Adjust size as needed
          painter: LineWithDiamondPainter(),
        ),
        const Text(
          'support@openui.design',
          style: TextStyle(
              color: Colors.black, fontFamily: 'TenorSans', fontSize: 16),
        ),
        const Text(
          '+60 825 876',
          style: TextStyle(
              color: Colors.black, fontFamily: 'TenorSans', fontSize: 16),
        ),
        const Text(
          '08:00 - 22:00 - Everyday',
          style: TextStyle(
              color: Colors.black, fontFamily: 'TenorSans', fontSize: 16),
        ),
        CustomPaint(
          size: const Size(300, 50), // Adjust size as needed
          painter: LineWithDiamondPainter(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'About',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'TenorSans', fontSize: 20),
            ),
            Text(
              'Contact',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'TenorSans', fontSize: 20),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlogList(),
                  ),
                );
              },
              child: Text(
                'Blog',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'TenorSans', fontSize: 20),
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        const Text(
          'Copyright \u00a9 OpenUI All Rights Reserved',
          style: TextStyle(
              color: Colors.black, fontFamily: 'TenorSans', fontSize: 14),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
