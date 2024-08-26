import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
// Import for Uint8List
import 'dart:io';

import '../../model/blog.dart';
import '../services/firebase_service.dart';



class BlogUpload extends StatefulWidget {
  final String itemName;

  const BlogUpload({super.key, required this.itemName});

  @override
  State<BlogUpload> createState() => _BlogUploadState();
}

class _BlogUploadState extends State<BlogUpload> {
  final _formKey = GlobalKey<FormState>();
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

        Blog blog = Blog(
          id: id,
          tag: _tagController.text,
          imageUrl: imageUrl,
          timestamp: FieldValue.serverTimestamp().toString(),
        );

        addBlog(widget.itemName, blog);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added successfully')),
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
    _tagController.dispose();
    _image = null;
    _imageBytes = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        const Text('A D D B L O G',style: TextStyle(fontFamily: 'TenorSans',fontSize: 30),),
        const SizedBox(height: 30,),
        Expanded(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [

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
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
