import 'package:flutter/material.dart';
import 'package:zaraclothingbrand/components/blog_container.dart';

import '../components/button.dart';
import '../components/drawer.dart';
import '../components/footer.dart';
import '../components/hash_tags_container.dart';
import '../components/line.dart';

class BlogList extends StatelessWidget {

  BlogList({super.key});

  final List<String> hashtags = [
    'Fashion',
    'Promo',
    'Policy',
    'Lookbook',
    'Year2021',
    'New'
  ];

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined)),
        ],
      ),
      drawer: const MyTabbedDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'BLOG',
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
            SizedBox(
              height: 30, // Adjust height as needed
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
           const BlogContainer(bgImage: 'lib/images/blog3.jpg', name: '2021 STYLE GUIDE:\nTHE BIGGEST FALL TRENDS'),
            const SizedBox(height: 5,),
            const BlogContainerRow(date: '4 days ago', name2: '#Fashion', name1: '#Tips',),
            const SizedBox(height: 20,),
            const BlogContainer(bgImage: 'lib/images/blog4.jpg', name: '2022 STYLE GUIDE:\nTHE BIGGEST TRENDS'),
            const SizedBox(height: 5,),
            const BlogContainerRow(date: '3 days ago', name2: '#Guide', name1: '#Trends',),
            const SizedBox(height: 20,),
            const BlogContainer(bgImage: 'lib/images/blog5.jpg', name: '2020 GUIDE:\nTHE BIGGEST TRENDS'),
            const SizedBox(height: 5,),
            const BlogContainerRow(date: '6 days ago', name2: '#Idea', name1: '#Style',),

            const SizedBox(height:30),

            const Mybutton2(text: 'LOAD MORE'),

            const SizedBox(height:30),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

