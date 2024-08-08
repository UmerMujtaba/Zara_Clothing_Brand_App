import 'package:flutter/material.dart';
import 'package:zaraclothingbrand/components/footer.dart';

import '../components/button.dart';
import '../components/drawer.dart';
import '../components/line.dart';
import 'new_arrival.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

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
                'PAGE NOT FOUND',
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
                image: AssetImage('lib/icons/girl.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                'We can\'t find the page you looking for, it will return to the ',
                style: TextStyle(fontFamily: 'TenorSans'),textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Button3(
                text: 'HOME PAGE',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewArrival()));
                },
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
