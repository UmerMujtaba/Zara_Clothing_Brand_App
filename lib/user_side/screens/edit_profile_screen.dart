import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara/user_side/components/app_bar.dart';
import 'package:zara/user_side/components/button.dart';
import 'package:zara/user_side/components/textss.dart';
import '../components/constants.dart';
import '../components/textfields.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
          const SnackBar(content: Text('User data updated successfully')),
        );
      } else {
        // Show an error message if the user is not logged in
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No user is currently signed in.')),
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
          title: TextWidget(
            text: confirmSave,
            color: Theme.of(context).colorScheme.inversePrimary,
            size: 16,
            fontFamily: 'TenorSans',
          ),
          content: TextWidget(
            text: areYouSureYouWantToSaveChanges,
            color: Theme.of(context).colorScheme.inversePrimary,
            size: 14,
            fontFamily: 'TenorSans',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: TextWidget(
                text: no,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 14,
                fontFamily: 'TenorSans',
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                await _saveUserData(); // Call the save function
              },
              child: TextWidget(
                text: yes,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 14,
                fontFamily: 'TenorSans',
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
              Row(
                children: [
                  TextWidget(
                    size: 16,
                    text: name,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    letterSpacing: 1,
                    fontFamily: 'TenorSans',
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              CustomTextField(
                controller: _nameController,
                hintText: hintText4,
                prefixIcon: const Icon(Icons.text_fields_outlined),
                keyboardType: TextInputType.text,
              ),
              const Gap(15),
              Row(
                children: [
                  TextWidget(
                    size: 16,
                    text: email2,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    letterSpacing: 1,
                    fontFamily: 'TenorSans',
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              CustomTextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
                readOnly: true,
              ),
              const Gap(15),
              Row(
                children: [
                  TextWidget(
                    size: 16,
                    text: phone,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    letterSpacing: 1,
                    fontFamily: 'TenorSans',
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              CustomTextField(
                controller: _phoneNoController,
                hintText: hintText5,
                prefixIcon: const Icon(Icons.phone),
                keyboardType: TextInputType.phone,
              ),
              const Gap(15),
              Row(
                children: [
                  TextWidget(
                    size: 16,
                    text: address,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    letterSpacing: 1,
                    fontFamily: 'TenorSans',
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              CustomTextField(
                controller: _addressController,
                hintText: hintText6,
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.home_outlined),
              ),
              const Gap(15),
              Row(
                children: [
                  TextWidget(
                    size: 16,
                    text: country,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    letterSpacing: 1,
                    fontFamily: 'TenorSans',
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              CustomTextField(
                  controller: _countryController,
                  hintText: hintText8,
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(Icons.flag_outlined)),
              const Gap(15),
              Row(
                children: [
                  TextWidget(
                    size: 16,
                    text: city,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    letterSpacing: 1,
                    fontFamily: 'TenorSans',
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              CustomTextField(
                controller: _cityController,
                hintText: hintText7,
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.location_city_outlined),
              ),
              const Gap(15),
              Row(
                children: [
                  TextWidget(
                    size: 16,
                    text: postalCode,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    letterSpacing: 1,
                    fontFamily: 'TenorSans',
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              CustomTextField(
                controller: _postalCodeController,
                hintText: hintText9,
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.numbers_outlined),
              ),
              const Gap(30),
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
