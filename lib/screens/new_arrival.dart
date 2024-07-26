import 'package:flutter/material.dart';
import '../components/footer_row.dart';
import '../components/image_container.dart';
import '../components/image_text_stack.dart';
import '../components/item_container.dart';
import '../components/line.dart';
import '../components/tabbar.dart';
import '../model/item_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 270,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0, // Adjusted
                        ),
                        itemCount: items.length, // Number of items
                        itemBuilder: (context, index) {
                          return ItemContainer(item: items[index]);
                        },
                      ),
                    ),
                    const Center(child: Text("Apparel")),
                    const Center(child: Text("Dress")),
                    const Center(child: Text("Bag")),
                  ],
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
                          fontFamily: 'TenorSans',
                          color: Colors.black,
                          fontSize: 22),
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
                  children:
                      items.map((item) => ItemContainer(item: item)).toList(),
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    // Set the background color to grey
                    borderRadius: BorderRadius.circular(
                        30), // Set the border radius to 20
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '#2021',
                      style: TextStyle(
                        fontFamily: 'TenorSans',
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      // Set the background color to grey
                      borderRadius: BorderRadius.circular(30), // Set
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('#spring',
                          style: TextStyle(
                            fontFamily: 'TenorSans',
                            color: Colors.black,
                            fontSize: 16,
                          )),
                    )),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      // Set the background color to grey
                      borderRadius: BorderRadius.circular(30), // Set
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('#collection',
                          style: TextStyle(
                            fontFamily: 'TenorSans',
                            color: Colors.black,
                            fontSize: 16,
                          )),
                    )),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      // Set the background color to grey
                      borderRadius: BorderRadius.circular(30), // Seto 20
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('#fall',
                          style: TextStyle(
                            fontFamily: 'TenorSans',
                            color: Colors.black,
                            fontSize: 16,
                          )),
                    ))
              ]),
              const SizedBox(height: 20.0), //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        // Set the background color to grey
                        borderRadius: BorderRadius.circular(
                            30), // Set the border radius to 20
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('#dress',
                            style: TextStyle(
                              fontFamily: 'TenorSans',
                              color: Colors.black,
                              fontSize: 16,
                            )),
                      )),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        // Set the background color to grey
                        borderRadius: BorderRadius.circular(30), // Set
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('#autumncollection',
                            style: TextStyle(
                              fontFamily: 'TenorSans',
                              color: Colors.black,
                              fontSize: 16,
                            )),
                      )),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      // Set the background color to grey
                      borderRadius: BorderRadius.circular(
                          30), // Set the border radius to 20
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '#openfashion',
                        style: TextStyle(
                          fontFamily: 'TenorSans',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0), //
              const Column(
                children: [
                  Text(
                    'Open',
                    style: TextStyle(
                        fontFamily: 'TenorSans',
                        color: Colors.black,
                        fontSize: 22),
                  ),
                  Text(
                    'Fashion',
                    style: TextStyle(
                        fontFamily: 'TenorSans',
                        color: Colors.black,
                        fontSize: 24),
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
              Image(
                image: AssetImage('lib/images/instagram.png'),
                height: 30,
                width: 30,
              ),
              SizedBox(height: 20),
              Column(
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
              Row(
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

              Text('support@openui.design', style: TextStyle(
                  color: Colors.black,fontFamily: 'TenorSans',fontSize: 16),),
              Text('+60 825 876', style: TextStyle(
                  color: Colors.black,fontFamily: 'TenorSans',fontSize: 16),),
              Text('08:00 - 22:00 - Everyday', style: TextStyle(
                  color: Colors.black,fontFamily: 'TenorSans',fontSize: 16),),

              CustomPaint(
                size: const Size(300, 50), // Adjust size as needed
                painter: LineWithDiamondPainter(),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('About', style: TextStyle(
                      color: Colors.black,fontFamily: 'TenorSans',fontSize: 20),),
                  Text('Contact', style: TextStyle(
                      color: Colors.black,fontFamily: 'TenorSans',fontSize: 20),),
                  Text('Blog', style: TextStyle(
                      color: Colors.black,fontFamily: 'TenorSans',fontSize: 20),),

                ],
              ),
              SizedBox(height: 50),
              Text('Copyright \u00a9 OpenUI All Rights Reserved', style: TextStyle(
                  color: Colors.black,fontFamily: 'TenorSans',fontSize: 14),),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
