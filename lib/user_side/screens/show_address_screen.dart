import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:zara/user_side/components/app_bar.dart';
import 'package:zara/user_side/components/drawer.dart';
import 'package:zara/user_side/components/textss.dart';
import '../components/gesture_detector.dart';
import 'add_shipping_address.dart';
import 'check_out_screen.dart';

class ShowAddressScreen extends ConsumerStatefulWidget {
  const ShowAddressScreen({super.key});

  @override
  ConsumerState<ShowAddressScreen> createState() => _ShowAddressScreenState();
}

class _ShowAddressScreenState extends ConsumerState<ShowAddressScreen> {
  String? _selectedAddress;

  @override
  Widget build(BuildContext context) {
    final userAsyncValue = ref.watch(userProvider);

    return Scaffold(
      appBar: myAppbar(),
      drawer: MyTabbedDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: userAsyncValue.when(
        data: (user) {
          final addresses = user.addresses ?? [];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AddAddressGestureDetector(
                  name: 'Add address',
                  icon: Icons.add,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddShippingAddress()),
                    );
                  },
                ),
                Gap(30),
                Expanded(
                  child: ListView.builder(
                    itemCount: addresses.length,
                    itemBuilder: (context, index) {
                      final address = addresses[index];
                      final addressString = [
                        address['address'],
                        address['city'],
                        address['state'],
                        address['zipCode']
                      ]
                          .where((element) =>
                              element != null && element.isNotEmpty)
                          .join(', ');

                      return ListTile(
                        title: Text(
                          addressString.isEmpty
                              ? 'No address available'
                              : addressString,
                          style: TextStyle(
                            fontFamily: 'TenorSans',
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                          ),
                        ),
                        trailing: Radio<String>(
                          value: addressString,
                          groupValue: _selectedAddress,
                          onChanged: (value) {
                            setState(() {
                              _selectedAddress = value;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        error: (Object error, StackTrace stackTrace) {
          return Center(child: Text('Error: $error'));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
