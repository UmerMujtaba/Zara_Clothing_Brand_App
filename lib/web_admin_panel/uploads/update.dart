import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../panels_scaffolds/product_list_screen.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  Future<Map<String, List<Map<String, dynamic>>>>
      _fetchCollectionsAndProducts() async {
    Map<String, List<Map<String, dynamic>>> collectionsWithProducts = {};

    List<String> collectionNames = [
      'Leather',
      'Dress',
      'Outer',
      'Glasses',
      'Hat',
      'Tshirts',
      'Fancy'
    ];

    for (String collectionName in collectionNames) {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection(collectionName).get();
      List<Map<String, dynamic>> products = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id; // Save the document ID
        return data;
      }).toList();

      collectionsWithProducts[collectionName] = products;
    }

    return collectionsWithProducts;
  }

  void _showEditDialog(BuildContext context, String collectionName,
      String productId, Map<String, dynamic> product) {
    TextEditingController nameController =
        TextEditingController(text: product['name']);
    TextEditingController descriptionController =
        TextEditingController(text: product['description']);
    TextEditingController tagController =
    TextEditingController(text: product['tag']);
    TextEditingController priceController =
        TextEditingController(text: product['price'].toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Product', style: TextStyle(fontFamily: 'TenorSans'),textAlign: TextAlign.center,),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name', labelStyle: TextStyle(fontFamily: 'TenorSans',fontSize: 20),),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description', labelStyle: TextStyle(fontFamily: 'TenorSans',fontSize: 20),),
                ),
                TextField(
                  controller: tagController,
                  decoration: const InputDecoration(labelText: 'Tag', labelStyle: TextStyle(fontFamily: 'TenorSans',fontSize: 20),),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Price', labelStyle: TextStyle(fontFamily: 'TenorSans',fontSize: 20),),
                  keyboardType: TextInputType.number,
                ),

              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel', style: TextStyle(fontFamily: 'TenorSans',fontSize: 16),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save', style: TextStyle(fontFamily: 'TenorSans',fontSize: 16),),
              onPressed: () async {
                // Save the updated data to Firestore
                await FirebaseFirestore.instance
                    .collection(collectionName)
                    .doc(productId)
                    .update({
                  'name': nameController.text,
                  'description': descriptionController.text,
                  'tag': tagController.text,
                  'price': double.tryParse(priceController.text) ?? 0,
                });

                // Update the local product data to reflect changes
                setState(() {
                  product['name'] = nameController.text;
                  product['description'] = descriptionController.text;
                  product['tag']=tagController.text;
                  product['price'] = double.tryParse(priceController.text) ?? 0;
                });

                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'C O L L E C T I O N S',
                style: TextStyle(
                  fontFamily: 'TenorSans',
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: FutureBuilder<Map<String, List<Map<String, dynamic>>>>(
                  future: _fetchCollectionsAndProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                          child:
                              Text('Error fetching collections and products'));
                    } else if (snapshot.hasData) {
                      Map<String, List<Map<String, dynamic>>>
                          collectionsWithProducts = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: collectionsWithProducts.length,
                        itemBuilder: (context, index) {
                          String collectionName =
                              collectionsWithProducts.keys.elementAt(index);
                          List<Map<String, dynamic>> products =
                              collectionsWithProducts[collectionName]!;
                          return ExpansionTile(
                            title: Text(
                              collectionName,
                              style: TextStyle(
                                  fontFamily: 'TenorSans', fontSize: 20),
                            ),
                            children: products.map((product) {
                              return ListTile(
                                title: Text(
                                  product['name'] ?? 'No name',
                                  style: TextStyle(
                                      fontFamily: 'TenorSans', fontSize: 18),
                                ),
                                subtitle: Text(
                                  product['description'] ?? 'No description',
                                  style: TextStyle(
                                      fontSize: 15, fontFamily: 'TenorSans'),
                                ),
                                onTap: () {
                                  _showEditDialog(context, collectionName,
                                      product['id'], product);

                                  // Refresh the data when returning to the Update screen
                                  setState(() {});
                                },
                              );
                            }).toList(),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('No collections found'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
