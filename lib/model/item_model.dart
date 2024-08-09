// item_model.dart
// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class ItemModel {
  final String imageUrl;
  final String name;
  final String price;
  String? tag;

  ItemModel({
    required this.imageUrl,
    required this.name,
    required this.price,
     this.tag,
  });
}

final List<ItemModel> items = [
  ItemModel(
    imageUrl: 'lib/images/1.jpg',  // Replace with actual image URL
    name: 'Reversible angora cardigan',
    price: '\$120',
tag:'233',
  ),
  ItemModel(
    imageUrl: 'lib/images/2.jpg',  // Replace with actual image URL
    name: ' reversible angora cardigan',
    price: '\$120',
    tag:'233',
  ),
  ItemModel(
    imageUrl: 'lib/images/3.jpg',  // Replace with actual image URL
    name: ' reversible angora cardigan',
    price: '\$120',
    tag:'233',
  ),
  ItemModel(
    imageUrl: 'lib/images/4.jpg',  // Replace with actual image URL
    name: ' reversible angora cardigan',
    price: '\$120',
    tag:'233',


  ),
  // Add more items here
  ItemModel(
    imageUrl: 'lib/images/1.jpg',  // Replace with actual image URL
    name: ' reversible angora cardigan',
    price: '\$120',
    tag:'233',
  ),
  ItemModel(
    imageUrl: 'lib/images/2.jpg',  // Replace with actual image URL
    name: ' reversible angora cardigan',
    price: '\$120',
    tag:'233',
  ),
  ItemModel(
    imageUrl: 'lib/images/3.jpg',  // Replace with actual image URL
    name: ' reversible angora cardigan',
    price: '\$120',
    tag:'233',
  ),
  ItemModel(
    imageUrl: 'lib/images/4.jpg',  // Replace with actual image URL
    name: ' reversible angora cardigan',
    price: '\$120',
    tag:'233',
  ),
];