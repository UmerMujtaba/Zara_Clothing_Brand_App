import 'package:flutter/material.dart';

import '../screens/product_page.dart';

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
