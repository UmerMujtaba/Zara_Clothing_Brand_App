import 'package:flutter/material.dart';

class ImageTextStack extends StatelessWidget {
  final String imagePath;
  final String text;
  final String imagePath2;
  final String text2;
  final double height;

  const ImageTextStack({
    super.key,
    required this.imagePath,
    required this.text,
    required this.imagePath2,
    required this.text2,
    this.height = 200.0, // Default height
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: SizedBox(
              height: height,
              child: Stack(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(0.7),
                      // Adjust the opacity as needed
                      BlendMode.saturation,
                    ),
                    child: Image(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 5,
                    child: Text(
                      text,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'TenorSans',
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10), // Add spacing between the two columns
          Expanded(
            child: SizedBox(
              height: height,
              child: Stack(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(0.7),
                      // Adjust the opacity as needed
                      BlendMode.saturation,
                    ),
                    child: Image(
                      image: AssetImage(imagePath2),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 5,
                    child: Text(
                      text2,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'TenorSans',
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
