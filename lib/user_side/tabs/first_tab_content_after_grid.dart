import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../model/product.dart';
import '../components/constants.dart';
import '../components/footer_row.dart';
import '../components/hash_tags_container.dart';
import '../components/image_container.dart';
import '../components/item_container.dart';
import '../components/line.dart';
import '../components/textss.dart';

class First_tab_content_after_Grid extends StatelessWidget {
  const First_tab_content_after_Grid({
    super.key,
    required PageController controller,
    required this.products,
  }) : _controller = controller;

  final PageController _controller;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    bool isDarkBackground =
        Theme.of(context).colorScheme.surface.computeLuminance() < 0.5;
    String imageAsset = isDarkBackground
        ? 'assets/images/Logo (2).png' // Image for dark backgrounds
        : 'assets/images/Logo (1).png';

    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                size: 22,
                text: exploreMore,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontFamily: 'TenorSans',
              ),
              const SizedBox(width: 5),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 24,
                ),
              ),
            ],
          ),
        ),

        CustomPaint(
          size: const Size(300, 50), // Adjust size as needed
          painter: LineWithDiamondPainter(
              lineColor: Theme.of(context).colorScheme.inversePrimary),
        ),
        const SizedBox(height: 16.0),
        // Add spacing between sections
        GridView.count(
          crossAxisCount: 3,
          // Adjust the number of columns as needed
          shrinkWrap: true,
          //physics: const NeverScrollableScrollPhysics(),
          children: const [
            ImageContainer(imagePath: 'assets/images/bosslogo.png'),
            ImageContainer(imagePath: 'assets/images/burberry.png'),
            ImageContainer(imagePath: 'assets/images/guccilogo.png'),
            // Add more images as needed
          ],
        ),
        const SizedBox(height: 10.0),
        // Add spacing between sections
        GridView.count(
          crossAxisCount: 3,
          // Adjust the number of columns as needed
          shrinkWrap: true,
          //physics: const NeverScrollableScrollPhysics(),
          children: const [
            ImageContainer(imagePath: 'assets/images/lacostelogo.png'),
            ImageContainer(imagePath: 'assets/images/pradalogo.png'),
            ImageContainer(imagePath: 'assets/images/triffanylogo.png'),
            // Add more images as needed
          ],
        ),
        CustomPaint(
          size: const Size(300, 50), // Adjust size as needed
          painter: LineWithDiamondPainter(
              lineColor: Theme.of(context).colorScheme.inversePrimary),
        ),
        const SizedBox(height: 10.0),
        //

        TextWidget(
          size: 22,
          text: collections,
          color: Theme.of(context).colorScheme.inversePrimary,
          letterSpacing: 2,
          fontFamily: 'TenorSans',
        ),

        const SizedBox(height: 10.0),
        //
        const Image(image: AssetImage('assets/images/collection.jpg')),

        const Padding(
          padding: EdgeInsets.all(40.0),
          child: Image(
            image: AssetImage('assets/images/summer.jpg'),
            height: 400,
          ),
        ),
        const SizedBox(height: 10.0),
        //
        TextWidget(
          size: 22,
          text: justForYou,
          color: Theme.of(context).colorScheme.inversePrimary,
          letterSpacing: 2,
          fontFamily: 'TenorSans',
        ),

        CustomPaint(
          size: const Size(300, 50), // Adjust size as needed
          painter: LineWithDiamondPainter(
              lineColor: Theme.of(context).colorScheme.inversePrimary),
        ),
        SizedBox(
          height: 310,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            children:
                products.map((item) => ItemContainer(item: item)).toList(),
          ),
        ),
        const SizedBox(height: 20.0),
        SmoothPageIndicator(
          controller: _controller,
          count: 3,
          effect: SlideEffect(
            dotWidth: 10.0,
            dotHeight: 10.0,
            paintStyle: PaintingStyle.stroke,
            strokeWidth: 1.5,
            dotColor: Theme.of(context).colorScheme.inversePrimary,
            activeDotColor: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        const SizedBox(height: 20.0),
        //
        TextWidget(
          size: 22,
          text: trending,
          color: Theme.of(context).colorScheme.inversePrimary,
          letterSpacing: 2,
          fontFamily: 'TenorSans',
        ),

        const SizedBox(height: 20.0),
        //
        const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          // ignore: unnecessary_const
          const HashTagsContainer(name: '#2021'),
          HashTagsContainer(name: '#spring'),
          HashTagsContainer(name: '#collection'),
          HashTagsContainer(name: '#Falls')
        ]),
        const SizedBox(height: 20.0),
        //
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HashTagsContainer(name: '#dress'),
            HashTagsContainer(name: '#autumn'),
            HashTagsContainer(name: '#openfashion'),
          ],
        ),
        const SizedBox(height: 20.0),
        //
        Column(
          children: [
            Image.asset(
              imageAsset,
              filterQuality: FilterQuality.high,
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        TextWidget(
          size: 16,
          text: makingALuxuriousLifeStyle,
          color: Theme.of(context).colorScheme.inversePrimary,
          letterSpacing: 2,
          textAlign: TextAlign.center,
          fontFamily: 'TenorSans',
        ),

        const SizedBox(height: 10),
        const ImageTextRow(
          imagePath: 'assets/images/fast.png',
          text: fastShippingOverOrder,
          imagePath2: 'assets/images/process.png',
          text2: sustainableProcessFromStartToFinish,
        ),
        const SizedBox(height: 30),
        const ImageTextRow(
          imagePath: 'assets/images/material.png',
          text: uniqueDesignAndHighQualityMaterial,
          imagePath2: 'assets/images/love.png',
          text2: fastShippingOverOrder,
        ),
      ],
    );
  }
}
