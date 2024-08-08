import 'package:flutter/material.dart';
import 'package:zaraclothingbrand/components/blog_container.dart';

import '../components/drawer.dart';
import '../components/email.dart';
import '../components/line.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
                'OUR STORY',
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
              const Text(
                'Open Fashion - Free Ecommerce UI KIT is a free download UI KIT. You can open it by using Figma. \n\nCreate stunnig shop with bulletproof guidelines and thoughtful components. Its library contains more than 50+ components supporting Light & dark Mode and 60+ ready to use mobile screens.',
                style: TextStyle(fontFamily: 'TenorSans'),
                textAlign: TextAlign.justify,
              ),
              const BlogContainer(bgImage: 'lib/images/blog3.jpg', name: ''),
              const SizedBox(height: 40),
              const Text(
                'SIGN UP',
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
              EmailForm(),
            ]),
          ),
        ),
      ),
    );
  }
}
