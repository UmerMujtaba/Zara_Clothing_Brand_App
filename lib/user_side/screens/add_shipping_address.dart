import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zara/user_side/components/app_bar.dart';
import 'package:zara/user_side/components/drawer.dart';
import 'package:zara/user_side/components/textfields.dart';

import '../components/gesture_detector.dart';
import '../components/line.dart';
import '../components/textss.dart';

class AddShippingAddress extends StatefulWidget {
  const AddShippingAddress({super.key});

  @override
  State<AddShippingAddress> createState() => _AddShippingAddressState();
}

class _AddShippingAddressState extends State<AddShippingAddress> {
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipController = TextEditingController();

  Future<void> addAddressToUser({
    required String address,
    required String city,
    required String state,
    required String zipCode,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Prepare the new address data
        Map<String, String> newAddress = {
          'address': address,
          'city': city,
          'state': state,
          'zipCode': zipCode,
        };

        // Use a transaction to ensure atomic updates
        await FirebaseFirestore.instance.runTransaction((transaction) async {
          DocumentReference userRef =
              FirebaseFirestore.instance.collection('users').doc(user.uid);

          DocumentSnapshot userDoc = await transaction.get(userRef);

          if (!userDoc.exists) {
            throw Exception('User document does not exist.');
          }

          // Cast document data to Map<String, dynamic>
          Map<String, dynamic>? userData =
              userDoc.data() as Map<String, dynamic>?;

          // Get current addresses or initialize if not present
          List<dynamic> addressesList =
              userData?['addresses'] as List<dynamic>? ?? [];
          addressesList.add(newAddress);

          // Update user document with the new addresses list
          transaction.update(userRef, {
            'addresses': addressesList,
          });
        });

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Address added successfully')),
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
        SnackBar(content: Text('Failed to add address: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const myAppbar(),
      drawer: const MyTabbedDrawer(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  const Gap(40),
                  TextWidget(
                    size: 24,
                    text: 'ADD SHIPPING ADDRESS',
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontFamily: 'TenorSans',
                  ),
                  CustomPaint(
                    size: const Size(200, 50), // Adjust size as needed
                    painter: LineWithDiamondPainter(
                      lineColor: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const Gap(20),
                  // Add some spacing between the title and the form
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField2(
                        controller: _addressController,
                        hintText: 'Address',
                      ),
                      const Gap(20),
                      CustomTextField2(
                        controller: _cityController,
                        hintText: 'City',
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: CustomTextField2(
                            controller: _stateController,
                            hintText: 'State',
                          )),
                          const Gap(10),
                          Expanded(
                              child: CustomTextField2(
                            controller: _zipController,
                            hintText: 'ZIP code',
                            keyboardType: TextInputType.number,
                          )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(), // Pushes the RandomGestureDetector to the bottom
            RandomGestureDetector(
              onTap: () {
                addAddressToUser(
                    address: _addressController.text,
                    city: _cityController.text,
                    state: _stateController.text,
                    zipCode: _zipController.text);
              },
              icon: Icons.my_location_outlined,
              name: 'ADD NOW',
            ),
          ],
        ),
      ),
    );
  }
}
