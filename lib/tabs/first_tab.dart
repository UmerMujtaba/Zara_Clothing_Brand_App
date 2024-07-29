import 'package:flutter/material.dart';
import 'package:zaraclothingbrand/components/hash_tags_container.dart';

import '../components/footer_row.dart';
import '../components/image_container.dart';
import '../components/item_container.dart';
import '../components/line.dart';
import '../model/item_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FirstTabContent extends StatelessWidget {
  final PageController controller;

  const FirstTabContent({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = PageController();
    return SingleChildScrollView(
        child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 600),
          // Adjust height as needed
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 270,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ItemContainer(item: items[index]);
            },
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
      ),
      TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Explore More',
              style: TextStyle(
                  fontFamily: 'TenorSans', color: Colors.black, fontSize: 22),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chevron_right,
                color: Colors.black,
                size: 24,
              ),
            ),
          ],
        ),
      ),
      CustomPaint(
        size: const Size(300, 50), // Adjust size as needed
        painter: LineWithDiamondPainter(),
      ),
      const SizedBox(height: 16.0), // Add spacing between sections
      GridView.count(
        crossAxisCount: 3, // Adjust the number of columns as needed
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ImageContainer(imagePath: 'lib/images/bosslogo.png'),
          ImageContainer(imagePath: 'lib/images/burberry.png'),
          ImageContainer(imagePath: 'lib/images/guccilogo.png'),
          // Add more images as needed
        ],
      ),
      const SizedBox(height: 10.0), // Add spacing between sections
      GridView.count(
        crossAxisCount: 3, // Adjust the number of columns as needed
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ImageContainer(imagePath: 'lib/images/lacostelogo.png'),
          ImageContainer(imagePath: 'lib/images/pradalogo.png'),
          ImageContainer(imagePath: 'lib/images/triffanylogo.png'),
          // Add more images as needed
        ],
      ),
      CustomPaint(
        size: const Size(300, 50), // Adjust size as needed
        painter: LineWithDiamondPainter(),
      ),
      const SizedBox(height: 10.0), //
      const Text(
        'COLLECTIONS',
        style: TextStyle(
            fontFamily: 'TenorSans',
            color: Colors.black,
            fontSize: 22,
            letterSpacing: 2),
      ),
      const SizedBox(height: 10.0), //
      const Image(image: AssetImage('lib/images/collection.jpg')),

      const Padding(
        padding: EdgeInsets.all(40.0),
        child: Image(
          image: AssetImage('lib/images/summer.jpg'),
          height: 400,
        ),
      ),
      const SizedBox(height: 10.0), //
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

      SizedBox(
        height: 300,
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: _controller,
          children: items.map((item) => ItemContainer(item: item)).toList(),
        ),
      ),
      SmoothPageIndicator(
        controller: _controller,
        count: 3,
        effect: SlideEffect(
          dotWidth: 10.0,
          dotHeight: 10.0,
          paintStyle: PaintingStyle.stroke,
          strokeWidth: 1.5,
          dotColor: Colors.grey,
          activeDotColor: Colors.grey.shade800,
        ),
      ),
      const SizedBox(height: 20.0), //
      const Text(
        '@ TRENDING',
        style: TextStyle(
            fontFamily: 'TenorSans',
            color: Colors.black,
            fontSize: 22,
            letterSpacing: 2),
      ),
      const SizedBox(height: 20.0), //
      const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      const HashTagsContainer(name: '#2021'),
        HashTagsContainer(name: '#spring'),
        HashTagsContainer(name: '#collection'),
        HashTagsContainer(name: '#Falls')
      ]),
      const SizedBox(height: 20.0), //
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HashTagsContainer(name: '#dress'),
         HashTagsContainer(name: '#autumncollection'),
         HashTagsContainer(name: '#openfashion'),
        ],
      ),
      const SizedBox(height: 20.0), //
      const Column(
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
      const Text(
        'Making a luxurious lifestyle accessible \nfor a generous group of women is our \ndaily drive',
        style: TextStyle(
            fontFamily: 'TenorSans', color: Colors.black, fontSize: 16),
        textAlign: TextAlign.center,
      ),

      const SizedBox(height: 10),

      const ImageTextRow(
        imagePath: 'lib/images/fast.png',
        text: 'Fast shipping. Free on order over \$25',
        imagePath2: 'lib/images/process.png',
        text2: 'Sustainable process from start to finish.',
      ),
      const SizedBox(height: 30),
      const ImageTextRow(
        imagePath: 'lib/images/material.png',
        text: 'Unique designs and high quality material.',
        imagePath2: 'lib/images/love.png',
        text2: 'Fast shipping. Free on order over \$25',
      ),
    ]));
  }
}
