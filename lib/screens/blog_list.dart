import 'package:flutter/material.dart';

import '../components/hash_tags_container.dart';
import '../components/line.dart';


class BlogList extends StatelessWidget {
  final List<String> hashtags = [
    'Fashion', 'Promo', 'Policy', 'Lookbook', 'Year2021', 'New'
  ];
   BlogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              'Open',
              style: TextStyle(
                  fontFamily: 'TenorSans', color: Colors.black, fontSize: 22),
            ),
            const Text(
              'Fashion',
              style: TextStyle(
                  fontFamily: 'TenorSans', color: Colors.black, fontSize: 24),
            ),
          ],
        ),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
        ],
      ),
      body: Column(
crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const Text(
            'JUST FOR YOU',
            style: TextStyle(
                fontFamily: 'TenorSans',
                color: Colors.black,
                fontSize: 22,
                letterSpacing: 2),
          ),
          CustomPaint(
            size: const Size(300, 50), // Adjust size as needed
            painter: LineWithDiamondPainter(),
          ),
      Container(
        height: 50, // Adjust height as needed
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hashtags.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: HashTagsContainer(name: hashtags[index]),
            );
          },
        ),
      ),

        ],

      ),
    );
  }
}
