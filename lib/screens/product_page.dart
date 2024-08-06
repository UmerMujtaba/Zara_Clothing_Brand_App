import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/drawer.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String _selectedColor = 'Red';
  String _selectedSize = 'Small';

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
          padding: const EdgeInsets.all(8.0),
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text('Color: '),
                          _buildColorRadioButton('Black', Colors.black),
                          _buildColorRadioButton(
                              'Orange', Colors.orange.shade300),
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
            ])
          ]),
        ),
      ),
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
