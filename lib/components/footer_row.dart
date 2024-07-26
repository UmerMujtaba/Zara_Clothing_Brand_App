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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image(
                image: AssetImage(imagePath),
                width: imageSize,
                height: imageSize,
              ),
              const SizedBox(width: 8),  // Add some spacing between image and text
              Text(
                text,
                style: textStyle ?? TextStyle(fontSize: 16,),  // Default text style if none provided
              textAlign: TextAlign.center,),
            ],
          ),
        ),
        SizedBox(width: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image(
                image: AssetImage(imagePath2),
                width: imageSize,
                height: imageSize,
              ),
              const SizedBox(width: 8),  // Add some spacing between image and text
              Text(
                text2,
                style: textStyle ?? TextStyle(fontSize: 16),  // Default text style if none provided
              ),
            ],
          ),
        ),
      ],
    );
  }
}
