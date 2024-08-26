// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:zara/user_side/components/textss.dart';
import '../screens/about_us.dart';
import '../screens/blog_list.dart';
import '../screens/contact_screen.dart';
import 'constants.dart';
import 'line.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage('assets/images/twitter.png'),
                height: 20,
                width: 20,
              ),
              Image(
                image: AssetImage('assets/images/instagram1.png'),
                height: 20,
                width: 20,
              ),
              Image(
                image: AssetImage('assets/images/youtube.png'),
                height: 20,
                width: 20,
              ),
            ],
          ),
          CustomPaint(
            size: const Size(300, 50), // Adjust size as needed
            painter: LineWithDiamondPainter(),
          ),
          TextWidget(size: 16, text: supportEmail, color: Colors.black,fontFamily: 'TenorSans',),
          TextWidget(size: 16, text: supportContact, color: Colors.black,fontFamily: 'TenorSans',),
          TextWidget(size: 16, text: dateAndTime, color: Colors.black,fontFamily: 'TenorSans',),
          CustomPaint(
            size: const Size(300, 50), // Adjust size as needed
            painter: LineWithDiamondPainter(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUs(),
                    ),
                  );
                },
                child: TextWidget(size: 20, text: 'About', color: Colors.black,fontFamily: 'TenorSans',),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactScreen(),
                    ),
                  );
                },
                child: TextWidget(size: 20, text: 'Contact', color: Colors.black,fontFamily: 'TenorSans',),
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
                child: TextWidget(size: 20, text: 'Blog', color: Colors.black,fontFamily: 'TenorSans',),
              ),
            ],
          ),
          const SizedBox(height: 50),
          TextWidget(size: 14, text: copyRight, color: Colors.black,fontFamily: 'TenorSans',),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
