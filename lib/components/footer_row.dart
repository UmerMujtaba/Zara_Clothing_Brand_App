import 'package:flutter/material.dart';

class ImageTextRow extends StatelessWidget {
  final String imagePath;
  final String text;
  final String imagePath2;
  final String text2;
  final double imageSize;
  final TextStyle? textStyle;

  const ImageTextRow({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.imagePath2,
    required this.text2,
    this.imageSize = 40.0,  // Default image size
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(

            child: Column(
              children: [
                Image(
                  image: AssetImage(imagePath),
                  width: imageSize,
                  height: imageSize,
                ),
                const SizedBox(height: 8),  // Add some spacing between image and text
                Text(
                  text,
                  style: textStyle ?? const TextStyle(fontSize: 16,fontFamily: 'TenorSans'),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Flexible(

            child: Column(
              children: [
                Image(
                  image: AssetImage(imagePath2),
                  width: imageSize,
                  height: imageSize,
                ),
                const SizedBox(height: 8),  // Add some spacing between image and text
                Text(
                  text2,
                  style: textStyle ?? const TextStyle(fontSize: 16,fontFamily: 'TenorSans'),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}