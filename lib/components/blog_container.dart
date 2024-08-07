import 'package:flutter/material.dart';
import 'package:zaraclothingbrand/components/hash_tags_container.dart';

class BlogContainer extends StatelessWidget {
  final String bgImage;
  final String name;

  const BlogContainer({super.key, required this.bgImage, required this.name});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0), // Adjust the horizontal padding as needed
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image(
                image: AssetImage(bgImage),
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              top: 10.0,
              right: 10.0,
              child: Icon(Icons.favorite_border, size: 30,color: Colors.white,),
            ),
            Positioned(
              bottom: 10.0,
              left: 10.0,
              child: Text(
                name,
                style: const TextStyle(
                  fontFamily: 'TenorSans',
                  fontSize: 22,
                  color: Colors.white, // Optional: Add color for better visibility
                  // backgroundColor: Colors.black54, // Optional: Add background color for better visibility
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class BlogContainerRow extends StatelessWidget {
  const BlogContainerRow({super.key, required this.date, required this.name2, required this.name1});
  final String date;
final String name1;
final String name2;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              HashTagsContainer(name: name1),
              const SizedBox(width: 15,),
              HashTagsContainer(name: name2),
            ],
          ),
        Text(date,
          style: const TextStyle(
            fontFamily: 'TenorSans',
            fontSize: 14,
            color: Colors.grey, // Optional: Add color for better visibility
            // backgroundColor: Colors.black54, // Optional: Add background color for better visibility
          ),),
        ]
      ),
    );
  }
}
