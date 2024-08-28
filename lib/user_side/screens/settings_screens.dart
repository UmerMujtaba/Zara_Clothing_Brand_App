import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zara/user_side/components/app_bar.dart';
import 'package:zara/user_side/components/button.dart';

import '../components/constants.dart';
import '../components/textfields.dart';

class SettingsScreens extends StatefulWidget {
  const SettingsScreens({super.key});

  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _phoneNoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          String? userEmail = userDoc['email'];
          if (userEmail != null) {
            _emailController.text = userEmail;
          } else {
            print("Username not found in Firestore.");
          }
        } else {
          print("User document does not exist.");
        }
      } else {
        print("No user is currently signed in.");
      }
    } catch (e) {
      print("Failed to load username: $e");
    }
  }

  Future<void> _saveUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Prepare the data to be saved
        Map<String, dynamic> userData = {
          'name': _nameController.text.trim(),
          'phone': _phoneNoController.text.trim(),
          'address': _addressController.text.trim(),
          'country': _countryController.text.trim(),
          'city': _cityController.text.trim(),
          'postalCode': _postalCodeController.text.trim(),
        };

        // Update the user's document in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update(userData);

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User data updated successfully')),
        );
      } else {
        // Show an error message if the user is not logged in
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No user is currently signed in.')),
        );
      }
    } catch (e) {
      // Handle errors and show a message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update user data: $e')),
      );
    }
  }
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Save'),
          content: Text('Are you sure you want to save your changes?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                await _saveUserData(); // Call the save function
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const myAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                child: ClipOval(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset('assets/images/user1.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1,
                        fontFamily: 'TenorSans'),
                  ),
                ],
              ),
              CustomTextField(
                controller: _nameController,
                hintText: hintText4,
                prefixIcon: Icon(Icons.text_fields_outlined),
                keyboardType: TextInputType.text,
              ),
              Gap(15),
              const Row(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1,
                        fontFamily: 'TenorSans'),
                  ),
                ],
              ),
              CustomTextField(
                controller:_emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(Icons.email_outlined),
                readOnly: true,
              ),
              Gap(15),
              const Row(
                children: [
                  Text(
                    'Phone',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1,
                        fontFamily: 'TenorSans'),
                  ),
                ],
              ),
              CustomTextField(
                controller: _phoneNoController,
                hintText: hintText5,
                prefixIcon: Icon(Icons.phone),
                keyboardType: TextInputType.phone,
              ),
              Gap(15),
              const Row(
                children: [
                  Text(
                    'Address',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1,
                        fontFamily: 'TenorSans'),
                  ),
                ],
              ),
              CustomTextField(
                controller: _addressController,
                hintText: hintText6,
                keyboardType: TextInputType.text,
                prefixIcon: Icon(Icons.home_outlined),
              ),
              Gap(15),
              const Row(
                children: [
                  Text(
                    'Country',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1,
                        fontFamily: 'TenorSans'),
                  ),
                ],
              ),
              CustomTextField(
                controller: _countryController,
                hintText: hintText8,
                keyboardType: TextInputType.text,
                prefixIcon: Icon(Icons.flag_outlined)
              ),
              Gap(15),
              const Row(
                children: [
                  Text(
                    'City',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1,
                        fontFamily: 'TenorSans'),
                  ),
                ],
              ),
              CustomTextField(
                controller: _cityController,
                hintText: hintText7,
                keyboardType: TextInputType.text,
                prefixIcon: Icon(Icons.location_city_outlined),
              ),
              Gap(15),
              const Row(
                children: [
                  Text(
                    'Postal Code',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1,
                        fontFamily: 'TenorSans'),
                  ),
                ],
              ),
              CustomTextField(
                controller: _postalCodeController,
                hintText: hintText9,
                keyboardType: TextInputType.number,
                prefixIcon: Icon(Icons.numbers_outlined),
              ),
              Gap(30),
              MyButton(
                text: save,
                onTap: () async {
                  _showConfirmationDialog();
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
