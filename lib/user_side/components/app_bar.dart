import 'package:flutter/material.dart';

import 'constants.dart';

var myAppbar = AppBar(
  backgroundColor: Colors.transparent,
  title: Image(image: AssetImage('assets/images/Logo (1).png'),filterQuality:FilterQuality.high),
  centerTitle: true,
  actions: [
    IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
    IconButton(
        onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined)),
  ],
);
