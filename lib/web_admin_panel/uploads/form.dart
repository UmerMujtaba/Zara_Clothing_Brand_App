import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
// Import for Uint8List
import 'dart:io';

import '../../model/product.dart';
import '../services/firebase_service.dart';



class FormUpload extends StatefulWidget {
  final String itemName;

  const FormUpload({super.key, required this.itemName});

  @override
  State<FormUpload> createState() => _FormUploadState();
}

class _FormUploadState extends State<FormUpload> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tagController = TextEditingController();
  File? _image; // For mobile platforms
  Uint8List? _imageBytes; // For web platforms
  bool _isSubmitting = false;
  String id = const Uuid().v4();

  final _firestore = FirebaseFirestore.instance;

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedImage =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        if (kIsWeb) {
          // For web, read image as bytes
          final Uint8List imageBytes = await pickedImage.readAsBytes();
          setState(() {
            _imageBytes = imageBytes; // Set bytes for web
          });
        } else {
          setState(() {
            _image = File(pickedImage.path); // Set file for mobile
          });
        }
      }
    } catch (e) {
      print('Failed to pick image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: $e')),
      );
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate() &&
        (_image != null || _imageBytes != null)) {
      setState(() {
        _isSubmitting = true;
      });

      try {
        String imageUrl = '';

        if (kIsWeb && _imageBytes != null) {
          // Upload bytes to Firebase Storage for web
          final storageRef = FirebaseStorage.instance
              .ref()
              .child(widget.itemName)
              .child('${DateTime.now().millisecondsSinceEpoch}.jpg');
          await storageRef.putData(_imageBytes!);
          imageUrl = await storageRef.getDownloadURL();
        } else if (_image != null) {
          // Upload file to Firebase Storage for mobile
          final storageRef = FirebaseStorage.instance
              .ref()
              .child(widget.itemName)
              .child('${DateTime.now().millisecondsSinceEpoch}.jpg');
          await storageRef.putFile(_image!);
          imageUrl = await storageRef.getDownloadURL();
        }

        Product product = Product(
          id: id,
          name: _nameController.text,
          price: double.parse(_priceController.text),
          description: _descriptionController.text,
          tag: _tagController.text,
          imageUrl: imageUrl,
          timestamp: FieldValue.serverTimestamp().toString(),
        );

        addProduct(widget.itemName, product);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added successfully')) ,
        );

        // Clear the form
        _formKey.currentState!.reset();
        setState(() {
          _image = null;
          _imageBytes = null;
        });
      } catch (e) {
        print('Error: $e'); // Log the error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add product: $e')),
        );
      } finally {
        setState(() {
          _isSubmitting = false;
        });
      }
    } else if (_image == null && _imageBytes == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image')),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _tagController.dispose();
    _image = null;
    _imageBytes = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('A D D  T O  I N V E N T O R Y',style: TextStyle(fontFamily: 'TenorSans',fontSize: 30),),
        const SizedBox(height: 30,),
        Expanded(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Product Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a product name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tagController,
                  decoration: const InputDecoration(labelText: 'Tag'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a tag';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                if (_image != null && !kIsWeb)
                  Image.file(_image!, height: 150)
                else if (_imageBytes != null && kIsWeb)
                  Image.memory(_imageBytes!, height: 150),
                TextButton.icon(
                  icon: const Icon(Icons.photo),
                  label: const Text('Select Image'),
                  onPressed: _pickImage,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(Colors.blue), // Set background color
                        foregroundColor: WidgetStateProperty.all<Color>(Colors.white), // Set text color
                        padding: WidgetStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                        ), // Set padding
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0), // Set border radius
                          ),
                        ),
                        elevation: WidgetStateProperty.all<double>(4.0), // Set elevation
                      ),
                      onPressed: _isSubmitting ? null : _submitForm,
                      child: _isSubmitting
                          ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                          : const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
