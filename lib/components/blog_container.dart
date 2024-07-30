import 'package:flutter/material.dart';
import 'package:zaraclothingbrand/components/hash_tags_container.dart';

class BlogContainer extends StatelessWidget {
  final String bgImage;
  final String name;

  const BlogContainer({Key? key, required this.bgImage, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 250,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0), // Adjust the horizontal padding as needed
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image(
                image: AssetImage(bgImage),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10.0,
              right: 10.0,
              child: Icon(Icons.favorite_border, size: 30,color: Colors.white,),
            ),
            Positioned(
              bottom: 10.0,
              left: 10.0,
              child: Text(
                name,
                style: TextStyle(
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
  const BlogContainerRow({Key? key, required this.date, required this.name2, required this.name1}) : super(key: key);
  final String date;
final String name1;
final String name2;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              HashTagsContainer(name: name1),
              SizedBox(width: 15,),
              HashTagsContainer(name: name2),
            ],
          ),
        Text(date,
          style: TextStyle(
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
