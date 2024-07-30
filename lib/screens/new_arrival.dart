import 'package:flutter/material.dart';
import '../components/footer.dart';
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
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
