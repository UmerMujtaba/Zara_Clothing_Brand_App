import 'package:flutter/material.dart';
import '../components/image_text_stack.dart';
import '../components/line.dart';
import '../components/tabbar.dart';

import '../tabs/first_tab.dart';
import 'blog_list.dart';

class NewArrival extends StatelessWidget {
  const NewArrival({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = PageController();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'NEW ARRIVAL',
            style: TextStyle(
              fontFamily: 'TenorSans',
              color: Colors.black,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          bottom: const TabbarExample(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.6, // Adjust height as needed
                child: TabBarView(
                  children: [
                    FirstTabContent(controller: _controller),
                    const Center(child: Text("Apparel")),
                    const Center(child: Text("Dress")),
                    const Center(child: Text("Bag")),
                  ],
                ),
              ),

              const SizedBox(height: 20.0), //
              const Text(
                'FOLLOW US',
                style: TextStyle(
                    fontFamily: 'TenorSans',
                    color: Colors.black,
                    fontSize: 22,
                    letterSpacing: 2),
              ),
              const SizedBox(height: 10.0), //
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
                  // SizedBox(height: 20),
                  ImageTextStack(
                    imagePath: 'lib/images/7.jpg',
                    text: '@mia',
                    imagePath2: 'lib/images/8.jpg',
                    text2: '@_john',
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
                        color: Colors.black,
                        fontFamily: 'TenorSans',
                        fontSize: 20),
                  ),
                  Text(
                    'Contact',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'TenorSans',
                        fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  BlogList(),
                        ),
                      );
                    },
                    child: Text(
                      'Blog',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'TenorSans',
                          fontSize: 20),
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
