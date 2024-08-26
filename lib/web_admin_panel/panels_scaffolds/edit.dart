import 'package:flutter/material.dart';
import '../../model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProductScreen extends StatelessWidget {
  final Product product;

  EditProductScreen({required this.product});

  Future<void> saveProduct(Product product) async {
    try {
      DocumentReference productRef = FirebaseFirestore.instance.collection('products').doc(product.id);

      await productRef.update({
        'name': product.name,
        'price': product.price,
        'tag': product.tag,
        'description': product.description,
      });

      print('Product updated successfully');
    } catch (e) {
      print('Error saving product: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: product.name);
    TextEditingController priceController = TextEditingController(text: product.price.toString());
    TextEditingController tagController = TextEditingController(text: product.tag);
    TextEditingController descriptionController = TextEditingController(text: product.description);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              // Save the updated product
              await saveProduct(
                product.copyWith(
                  name: nameController.text,
                  price: double.parse(priceController.text),
                  tag: tagController.text,
                  description: descriptionController.text,
                ),
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tagController,
              decoration: const InputDecoration(labelText: 'Tag'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
      ),
    );
  }
}
