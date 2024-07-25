// item_model.dart
import 'package:flutter/material.dart';

class ItemModel {
  final String imageUrl;
  final String name;
  final String price;

  ItemModel({
    required this.imageUrl,
    required this.name,
    required this.price,
  });
}

final List<ItemModel> items = [
  ItemModel(
    imageUrl: 'lib/images/1.jpg',  // Replace with actual image URL
    name: '21WN reversible angora cardigan',
    price: '\$120',
  ),
  ItemModel(
    imageUrl: 'lib/images/2.jpg',  // Replace with actual image URL
    name: '21WN reversible angora cardigan',
    price: '\$120',
  ),
  ItemModel(
    imageUrl: 'lib/images/3.jpg',  // Replace with actual image URL
    name: '21WN reversible angora cardigan',
    price: '\$120',
  ),
  ItemModel(
    imageUrl: 'lib/images/4.jpg',  // Replace with actual image URL
    name: '21WN reversible angora cardigan',
    price: '\$120',
  ),
  // Add more items here
  ItemModel(
    imageUrl: 'lib/images/1.jpg',  // Replace with actual image URL
    name: '21WN reversible angora cardigan',
    price: '\$120',
  ),
  ItemModel(
    imageUrl: 'lib/images/2.jpg',  // Replace with actual image URL
    name: '21WN reversible angora cardigan',
    price: '\$120',
  ),
  ItemModel(
    imageUrl: 'lib/images/3.jpg',  // Replace with actual image URL
    name: '21WN reversible angora cardigan',
    price: '\$120',
  ),
  ItemModel(
    imageUrl: 'lib/images/4.jpg',  // Replace with actual image URL
    name: '21WN reversible angora cardigan',
    price: '\$120',
  ),
];