import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../model/product.dart';
import '../components/app_bar.dart';
import '../components/constants.dart';
import '../components/drawer.dart';
import '../components/footer.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

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
      backgroundColor: Colors.white,
      appBar: myAppbar,
      drawer: const MyTabbedDrawer(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: <Widget>[
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              // Assuming you want to maintain a specific aspect ratio
              double aspectRatio =
                  4 / 3; // Change this to match your image's aspect ratio
              double imageHeight = constraints.maxWidth / aspectRatio;

              return ImagePageControll(
                  imageHeight: imageHeight,
                  controller: _controller,
                  widget: widget);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: ScrollingDotsEffect(
                  activeDotColor: Colors.grey.shade800,
                  dotHeight: 8,
                  dotWidth: 8),
            ),
          ),
          Row(
            children: [
              Expanded(
                // Make sure the Row allocates enough space for the Column
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontFamily: 'TenorSans',
                          letterSpacing: 2,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        widget.product.description,
                        style: const TextStyle(
                          fontFamily: 'TenorSans',
                        ),
                        maxLines: null, // Allow unlimited lines
                        softWrap: true, // Wrap text to the next line
                        overflow: TextOverflow
                            .visible, // Show all text without truncating
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.product.price.toString(),
                        style: const TextStyle(
                            fontFamily: 'TenorSans',
                            color: Colors.red,
                            fontSize: 16),
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
                                _buildColorRadioButton(
                                    'Grey', Colors.grey.shade400),
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
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const AddToBasket(),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Text(
                material,
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
            materialDetail,
            style: TextStyle(
              fontFamily: 'TenorSans',
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Text(
                care,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'TenorSans',
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            careDetail(widget.product.name),
            style: const TextStyle(
              fontFamily: 'TenorSans',
              // fontWeight: FontWeight.w600
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Image(
                image: AssetImage('assets/icons/not-bleach.png'),
                width: 18,
                height: 18,
              ),
              SizedBox(width: 10),
              Text(
                doNotBleach,
                style: TextStyle(fontFamily: 'TenorSans', fontSize: 15),
              )
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              Image(
                image: AssetImage('assets/icons/quick-dry.png'),
                width: 18,
                height: 18,
              ),
              SizedBox(width: 10),
              Text(
                doNotTumbleDry,
                style: TextStyle(fontFamily: 'TenorSans', fontSize: 15),
              )
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              Image(
                image: AssetImage('assets/icons/towels.png'),
                width: 18,
                height: 18,
              ),
              SizedBox(width: 10),
              Text(
                dryCleanWith,
                style: TextStyle(fontFamily: 'TenorSans', fontSize: 15),
              )
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              Image(
                image: AssetImage('assets/icons/ironing.png'),
                width: 18,
                height: 18,
              ),
              SizedBox(width: 10),
              Text(
                ironAtMax,
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
                    freeFlatRateShipping,
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
                deliveryTimeDate,
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
                    codPolicy,
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
                    returnPolicy,
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

class AddToBasket extends StatelessWidget {
  const AddToBasket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}

class ImagePageControll extends StatelessWidget {
  const ImagePageControll({
    super.key,
    required this.imageHeight,
    required PageController controller,
    required this.widget,
  }) : _controller = controller;

  final double imageHeight;
  final PageController _controller;
  final ProductPage widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageHeight, // Dynamic height based on the aspect ratio
      child: PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        children: [
          Image.network(
            widget.product.imageUrl,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
          Image.network(
            widget.product.imageUrl,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
          Image.network(
            widget.product.imageUrl,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
          Image.network(
            widget.product.imageUrl,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
