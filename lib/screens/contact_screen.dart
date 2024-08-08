import 'package:flutter/material.dart';
import 'package:zaraclothingbrand/screens/404_screen.dart';

import '../components/button.dart';
import '../components/drawer.dart';
import '../components/footer.dart';
import '../components/line.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Open',
              style: TextStyle(
                  fontFamily: 'TenorSans', color: Colors.black, fontSize: 22),
            ),
            Text(
              'Fashion',
              style: TextStyle(
                  fontFamily: 'TenorSans', color: Colors.black, fontSize: 24),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined)),
        ],
      ),
      drawer: const MyTabbedDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              const SizedBox(height: 40),
              const Text(
                'CONTACT US',
                style: TextStyle(
                    fontFamily: 'TenorSans',
                    color: Colors.black,
                    fontSize: 22,
                    letterSpacing: 2),
              ),
              CustomPaint(
                size: const Size(250, 50), // Adjust size as needed
                painter: LineWithDiamondPainter(),
              ),
              const Image(
                image: AssetImage('lib/icons/messenger.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Need an ASAP answer? Contact us via chat, 24/7 For existing furniture orders, please call us.',
                style: TextStyle(fontFamily: 'TenorSans'),
              ),
              const SizedBox(height: 20),
              Button3(
                text: 'CHAT WITH US',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ErrorScreen()));
                },
              ),
              const SizedBox(height: 20),
              const Image(
                image: AssetImage('lib/icons/email.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                'You can text us at 800-309-2622 - or click on the "text us" link below on your mobile device. Please allow the system to acknowledge a simple greeting (even "Hi" will do.) before provding your question/ order details. Consent is not required for any purchase. Message and data rates may apply. Text messaging may not be available via all carriers',
                style: TextStyle(fontFamily: 'TenorSans'),
              ),
              const SizedBox(height: 20),
              Button3(
                text: 'TEXT US',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ErrorScreen()));
                },
              ),
              const SizedBox(height: 20),
              const Image(
                image: AssetImage('lib/icons/twitter.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                'To send us a private or direct message, like @open Fashion on Facebook or follow us on Twitter. We\'ll get back to you ASAP. Please include your name, order number, and email address for faster response.',
                style: TextStyle(fontFamily: 'TenorSans'),
              ),
              const SizedBox(height: 40),
              const Footer(),
            ]),
          ),
        ),
      ),
    );
  }
}
