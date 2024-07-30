import 'package:flutter/material.dart';

class HashTagsContainer extends StatelessWidget {
  final String name;
  const HashTagsContainer({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        // Set the background color to grey
        borderRadius: BorderRadius.circular(30), // Set
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontFamily: 'TenorSans',
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
