// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../providers/providers.dart';
import '../components/constants.dart';
import '../components/footer.dart';
import '../components/footer_row.dart';
import '../components/hash_tags_container.dart';
import '../components/image_container.dart';
import '../components/item_container.dart';
import '../components/line.dart';
import '../components/new_arrival_content_after_tabBarView.dart';
import '../components/textss.dart';

class SecondAndThirdTab extends ConsumerWidget {
  final PageController controller;
  final String collectionName;

  const SecondAndThirdTab(
      {super.key, required this.controller, required this.collectionName});

  // bool _isSortedAscending = true;
  //
  // Future<void> _sortProducts(List<Product> products) async {
  //   setState(() {
  //     products.sort((a, b) => _isSortedAscending
  //         ? a.name.compareTo(b.name)
  //         : b.name.compareTo(a.name));
  //     _isSortedAscending = !_isSortedAscending;
  //   });
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsyncValue = ref.watch(productsProvider(collectionName));

    final _controller = PageController();
    // return StreamBuilder<List<Product>>(
    //     stream: _firebaseService.fetchPerCollection(widget.collectionName),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(child: CircularProgressIndicator());
    //       } else if (snapshot.hasError) {
    //         return Center(child: Text('Error: ${snapshot.error}'));
    //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    //         return Center(child: Text('Empty'));
    //       }
    //
    //       final products = snapshot.data!;
    return productsAsyncValue.when(
      data: (products) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            products.isEmpty
                                ? 'None'
                                : products.length == 1
                                    ? '1 Product'
                                    : '${products.length} Products',
                            style: TextStyle(fontFamily: 'TenorSans'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          // onTap: () => _sortProducts(products),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                            width: 40,
                            height: 40,
                            child: const Icon(
                              Icons.sort,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: double.infinity),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 350,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ItemContainer(item: products[index]);
                    },
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      TextWidget(size: 22, text: exploreMore, color: Colors.black,fontFamily: 'TenorSans',),

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
                    ImageContainer(imagePath: 'assets/images/bosslogo.png'),
                    ImageContainer(imagePath: 'assets/images/burberry.png'),
                    ImageContainer(imagePath: 'assets/images/guccilogo.png'),
                    // Add more images as needed
                  ],
                ),
                const SizedBox(height: 10.0), // Add spacing between sections
                GridView.count(
                  crossAxisCount: 3, // Adjust the number of columns as needed
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    ImageContainer(imagePath: 'assets/images/lacostelogo.png'),
                    ImageContainer(imagePath: 'assets/images/pradalogo.png'),
                    ImageContainer(imagePath: 'assets/images/triffanylogo.png'),
                    // Add more images as needed
                  ],
                ),
                CustomPaint(
                  size: const Size(300, 50), // Adjust size as needed
                  painter: LineWithDiamondPainter(),
                ),
                const SizedBox(height: 10.0), //

                TextWidget(size: 22, text: collections, color: Colors.black,letterSpacing: 2,fontFamily: 'TenorSans',),

                const SizedBox(height: 10.0), //
                const Image(image: AssetImage('assets/images/collection.jpg')),

                const Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Image(
                    image: AssetImage('assets/images/summer.jpg'),
                    height: 400,
                  ),
                ),
                const SizedBox(height: 10.0), //

                TextWidget(size: 22, text: justForYou, color: Colors.black,letterSpacing: 2,fontFamily: 'TenorSans',),

                CustomPaint(
                  size: const Size(300, 50), // Adjust size as needed
                  painter: LineWithDiamondPainter(),
                ),
                SizedBox(
                  height: 310,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    children: products
                        .map((item) => ItemContainer(item: item))
                        .toList(),
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

                TextWidget(size: 22, text: trending, color: Colors.black,letterSpacing: 2,fontFamily: 'TenorSans',),

                const SizedBox(height: 20.0), //
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // ignore: unnecessary_const
                      const HashTagsContainer(name: '#2021'),
                      HashTagsContainer(name: '#spring'),
                      HashTagsContainer(name: '#collection'),
                      HashTagsContainer(name: '#Falls')
                    ]),
                const SizedBox(height: 20.0), //
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HashTagsContainer(name: '#dress'),
                    HashTagsContainer(name: '#autumn'),
                    HashTagsContainer(name: '#openfashion'),
                  ],
                ),
                const SizedBox(height: 20.0), //
                const Column(
                  children: [
                    Image(
                        image: AssetImage('assets/images/Logo (1).png'),
                        filterQuality: FilterQuality.high),
                  ],
                ),
                const SizedBox(height: 20.0), //
                TextWidget(size: 16, text: makingALuxuriousLifeStyle, color: Colors.black,textAlign: TextAlign.center,fontFamily: 'TenorSans',),
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
                New_arrival_content_after_tabBarView(),
                SizedBox(height: 500, child: Footer()),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
