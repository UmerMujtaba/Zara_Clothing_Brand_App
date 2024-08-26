import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final String collectionName;
  final String productId;
  final Map<String, dynamic> productData;

  const ProductDetailScreen({
    Key? key,
    required this.collectionName,
    required this.productId,
    required this.productData,
  }) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late TextEditingController _nameController;
  late TextEditingController _tagController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.productData['name']);
    _tagController = TextEditingController(text: widget.productData['tag']);
    _descriptionController = TextEditingController(text: widget.productData['description']);
    _priceController = TextEditingController(text: widget.productData['price'].toString());
  }

  Future<void> _saveProduct() async {
    // Save the updated product data to Firestore
    await FirebaseFirestore.instance
        .collection(widget.collectionName)
        .doc(widget.productId)
        .update({
      'name': _nameController.text,
      'tag': _tagController.text,
      'description': _descriptionController.text,
      'price': double.parse(_priceController.text),
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product', style: TextStyle(fontFamily: 'TenorSans')),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveProduct,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _tagController,
              decoration: InputDecoration(labelText: 'Tag'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}