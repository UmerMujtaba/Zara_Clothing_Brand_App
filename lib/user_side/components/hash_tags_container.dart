// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class HashTagsContainer extends StatelessWidget {
  final String name;

  const HashTagsContainer({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        // Set the background color to grey
        borderRadius: BorderRadius.circular(30), // Set
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontFamily: 'TenorSans',
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
