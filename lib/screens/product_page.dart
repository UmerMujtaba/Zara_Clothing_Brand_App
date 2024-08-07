import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/drawer.dart';
import '../components/footer.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String _selectedColor = 'Red';
  String _selectedSize = 'Small';
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;

  @override
  Widget build(BuildContext context) {
    // Variables for selected color and size

    final _controller = PageController();

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
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: <Widget>[
          SizedBox(
            height: 500,
            child: PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: const [
                Image(
                  image: AssetImage('lib/images/2.jpg'),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Image(
                  image: AssetImage('lib/images/2.jpg'),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Image(
                  image: AssetImage('lib/images/2.jpg'),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Image(
                  image: AssetImage('lib/images/2.jpg'),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Image(
                  image: AssetImage('lib/images/2.jpg'),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: 5,
              effect: ScrollingDotsEffect(
                  activeDotColor: Colors.grey.shade800,
                  dotHeight: 8,
                  dotWidth: 8),
            ),
          ),
          Row(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'MOHAN',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  fontFamily: 'TenorSans',
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.start,
              ),
              const Text(
                'Recycle Bounce Knit Cardigan Pink',
                style: TextStyle(
                  fontFamily: 'TenorSans',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                '\$220',
                style: TextStyle(
                    fontFamily: 'TenorSans', color: Colors.red, fontSize: 16),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    const Text('Color: '),
                    _buildColorRadioButton('Black', Colors.black),
                    _buildColorRadioButton('Orange', Colors.orange.shade300),
                    _buildColorRadioButton('Grey', Colors.grey.shade400),
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
                Row(children: [
                  const Text('Size: '),
                  _buildSizeRadioButton('S'),
                  _buildSizeRadioButton('M'),
                  _buildSizeRadioButton('L'),
                ]),
              ]),
            ]),
          ]),
          const SizedBox(
            height: 10,
          ),
          Container(
              color: Colors.black,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      Text('ADD TO BASKET',
                          style: TextStyle(
                              fontFamily: 'TenorSans', color: Colors.white)),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Text(
                'MATERIALS',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'TenorSans',
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'We work with monitoring programmes to ensue compliance with safety, health and qualtiy standards for our products.',
            style: TextStyle(
              fontFamily: 'TenorSans',
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Text(
                'CARE',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'TenorSans',
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            'To keep your jackets and coats clean, you only need to freshen them up and go over them with a cloth or a clothes brush. If you need to dry clean a garment look for a dry cleaner that uses technologies that are respectful for the environment',
            style: TextStyle(
              fontFamily: 'TenorSans',
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Image(
                image: AssetImage('lib/icons/not-bleach.png'),
                width: 18,
                height: 18,
              ),
              SizedBox(width: 10),
              Text(
                'Do not use bleach',
                style: TextStyle(fontFamily: 'TenorSans', fontSize: 15),
              )
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              Image(
                image: AssetImage('lib/icons/quick-dry.png'),
                width: 18,
                height: 18,
              ),
              SizedBox(width: 10),
              Text(
                'Do not tumble dry',
                style: TextStyle(fontFamily: 'TenorSans', fontSize: 15),
              )
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              Image(
                image: AssetImage('lib/icons/towels.png'),
                width: 18,
                height: 18,
              ),
              SizedBox(width: 10),
              Text(
                'Dry clean with tetrachloroethylene dry',
                style: TextStyle(fontFamily: 'TenorSans', fontSize: 15),
              )
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              Image(
                image: AssetImage('lib/icons/ironing.png'),
                width: 18,
                height: 18,
              ),
              SizedBox(width: 10),
              Text(
                'Iron at maximum of 110\u2103/230\u2109',
                style: TextStyle(fontFamily: 'TenorSans', fontSize: 15),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.local_shipping_outlined),
                  SizedBox(width: 8),
                  Text(
                    'Free Flat Rate Shipping',
                    style: TextStyle(fontFamily: 'TenorSans'),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  _isExpanded1 ? Icons.expand_less : Icons.expand_more,
                ),
                onPressed: () {
                  setState(() {
                    _isExpanded1 = !_isExpanded1;
                  });
                },
              ),
            ],
          ),
          if (_isExpanded1)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Estimated to be delivered on\n09/11/2021 - 12/11/2021',
                style: TextStyle(color: Colors.grey, fontFamily: 'TenorSans'),
              ),
            ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.local_offer_outlined),
                  SizedBox(width: 8),
                  Text(
                    'COD Policy',
                    style: TextStyle(fontFamily: 'TenorSans'),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  _isExpanded2 ? Icons.expand_less : Icons.expand_more,
                ),
                onPressed: () {
                  setState(() {
                    _isExpanded2 = !_isExpanded2;
                  });
                },
              ),
            ],
          ),
          if (_isExpanded2)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'OK',
                style: TextStyle(color: Colors.grey, fontFamily: 'TenorSans'),
              ),
            ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.loop),
                  SizedBox(width: 8),
                  Text(
                    'Return Policy',
                    style: TextStyle(fontFamily: 'TenorSans'),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  _isExpanded3 ? Icons.expand_less : Icons.expand_more,
                ),
                onPressed: () {
                  setState(() {
                    _isExpanded3 = !_isExpanded3;
                  });
                },
              ),
            ],
          ),
          if (_isExpanded3)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '1 week',
                style: TextStyle(color: Colors.grey, fontFamily: 'TenorSans'),
              ),
            ),
          const SizedBox(height: 20),
          const Footer(),
        ]),
      )),
    );
  }

  // Function to build custom color radio button
  Widget _buildColorRadioButton(String color, Color buttonColor) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = color;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: buttonColor,
          border: Border.all(
            color: _selectedColor == color ? Colors.black : Colors.transparent,
            width: 2.0,
          ),
        ),
        width: 25.0,
        height: 25.0,
      ),
    );
  }

  // Function to build custom size radio button
  Widget _buildSizeRadioButton(String size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSize = size;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _selectedSize == size ? Colors.grey[600] : Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        width: 25.0,
        height: 25.0,
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: _selectedSize == size ? Colors.white : Colors.black,
              fontFamily: 'TenorSans',
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}
