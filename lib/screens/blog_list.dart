import 'package:flutter/material.dart';
import 'package:zaraclothingbrand/components/blog_container.dart';

import '../components/footer.dart';
import '../components/hash_tags_container.dart';
import '../components/line.dart';

class BlogList extends StatelessWidget {
  final List<String> hashtags = [
    'Fashion',
    'Promo',
    'Policy',
    'Lookbook',
    'Year2021',
    'New'
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
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
            Container(
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
           BlogContainer(bgImage: 'lib/images/blog3.jpg', name: '2021 STYLE GUIDE:\nTHE BIGGEST FALL TRENDS'),
            SizedBox(height: 5,),
            BlogContainerRow(date: '4 days ago', name2: '#Fashion', name1: '#Tips',),
            SizedBox(height: 20,),
            BlogContainer(bgImage: 'lib/images/blog4.jpg', name: '2022 STYLE GUIDE:\nTHE BIGGEST TRENDS'),
            SizedBox(height: 5,),
            BlogContainerRow(date: '3 days ago', name2: '#Guide', name1: '#Trends',),
            SizedBox(height: 20,),
            BlogContainer(bgImage: 'lib/images/blog5.jpg', name: '2020 GUIDE:\nTHE BIGGEST TRENDS'),
            SizedBox(height: 5,),
            BlogContainerRow(date: '6 days ago', name2: '#Idea', name1: '#Style',),

            Center(
              child: Container(
                decoration:BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [Text('LOAD MORE'),
                    SizedBox(width: 5),
                      Icon(Icons.add,size: 15,color: Colors.black,)
                    ]
                  ),
                )
              ),
            ),

            SizedBox(height:30),
            Footer(),
          ],
        ),
      ),
    );
  }
}
