import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zara/providers/providers.dart';
import '../../model/cart.dart';
import '../../model/product.dart';
import '../components/add_to_basket.dart';
import '../components/app_bar.dart';
import '../components/constants.dart';
import '../components/drawer.dart';
import '../components/footer.dart';
import '../components/image_page_controller.dart';

class ProductPage extends ConsumerWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.watch(cartProvider.notifier);
    final _isExpanded2 = ref.watch(isExpanded2Provider);
    final _selectedColor = ref.watch(selectedColorProvider);
    final _selectedSize = ref.watch(selectedSizeProvider);

    bool _isExpanded1 = false;

    bool _isExpanded3 = false;

    void _addToCart() {
      final cartItem = CartItem(
        product: product,
        color: _selectedColor,
        size: _selectedSize,
      );
      cartNotifier.addItem(cartItem);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Added to Basket')),
      );
    }

    // Variables for selected color and size
    final _controller = PageController();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const myAppbar(),
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
                  widget: ProductPage(product: product));
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
                        product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontFamily: 'TenorSans',
                          letterSpacing: 2,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                          fontFamily: 'TenorSans',
                          color: Theme.of(context).colorScheme.inversePrimary,
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
                        'Rs ${product.price.toString()}',
                        style: const TextStyle(
                            fontFamily: 'TenorSans',
                            color: Colors.orangeAccent,
                            fontSize: 16),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Color: ',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                ),
                                _buildColorRadioButton(
                                    'Black', Colors.black, ref),
                                _buildColorRadioButton(
                                    'Orange', Colors.orange.shade300, ref),
                                _buildColorRadioButton(
                                    'Grey', Colors.grey.shade400, ref),
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Row(children: [
                              const Text('Size: '),
                              _buildSizeRadioButton('S', ref),
                              _buildSizeRadioButton('M', ref),
                              _buildSizeRadioButton('L', ref),
                            ]),
                          ]),
                    ]),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                _addToCart();
              },
              child: const AddToBasket()),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                material,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'TenorSans',
                  letterSpacing: 2,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            materialDetail,
            style: TextStyle(
              fontFamily: 'TenorSans',
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                care,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'TenorSans',
                  letterSpacing: 2,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            careDetail(product.name),
            style: TextStyle(
              fontFamily: 'TenorSans',
              color: Theme.of(context).colorScheme.inversePrimary,
              // fontWeight: FontWeight.w600
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Image(
                image: AssetImage('assets/icons/not-bleach.png'),
                width: 18,
                height: 18,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              SizedBox(width: 10),
              Text(
                doNotBleach,
                style: TextStyle(
                  fontFamily: 'TenorSans',
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Image(
                image: AssetImage('assets/icons/quick-dry.png'),
                width: 18,
                height: 18,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              SizedBox(width: 10),
              Text(
                doNotTumbleDry,
                style: TextStyle(
                  fontFamily: 'TenorSans',
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Image(
                image: AssetImage('assets/icons/towels.png'),
                width: 18,
                height: 18,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              SizedBox(width: 10),
              Text(
                dryCleanWith,
                style: TextStyle(
                  fontFamily: 'TenorSans',
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Image(
                image: AssetImage('assets/icons/ironing.png'),
                width: 18,
                height: 18,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              SizedBox(width: 10),
              Text(
                ironAtMax,
                style: TextStyle(
                  fontFamily: 'TenorSans',
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.local_shipping_outlined,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  SizedBox(width: 8),
                  Text(
                    freeFlatRateShipping,
                    style: TextStyle(
                      fontFamily: 'TenorSans',
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  _isExpanded2 ? Icons.expand_less : Icons.expand_more,
                ),
                onPressed: () {
                  ref.read(isExpanded2Provider.notifier).state = !_isExpanded2;
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
                  ref.read(isExpanded2Provider.notifier).state = !_isExpanded2;
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
                  _isExpanded2 ? Icons.expand_less : Icons.expand_more,
                ),
                onPressed: () {
                  ref.read(isExpanded2Provider.notifier).state = !_isExpanded2;
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
  Widget _buildColorRadioButton(
      String color, Color buttonColor, WidgetRef ref) {
    final _selectedColor = ref.watch(selectedColorProvider);

    return GestureDetector(
      onTap: () {
        ref.read(selectedColorProvider.notifier).state = color;
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

  Widget _buildSizeRadioButton(String size, WidgetRef ref) {
    final _selectedSize = ref.watch(selectedSizeProvider);

    return GestureDetector(
      onTap: () {
        ref.read(selectedSizeProvider.notifier).state = size;
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
