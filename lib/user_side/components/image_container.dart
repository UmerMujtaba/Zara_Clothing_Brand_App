import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imagePath;

  const ImageContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, // Set width and height to be the same
      height: 120,

      margin: const EdgeInsets.all(8.0), // Add margin if needed
      child: Image(
        image: AssetImage(imagePath),
        fit: BoxFit.contain,
        // Adjust the fit property as needed
      ),
    );
  }
}
