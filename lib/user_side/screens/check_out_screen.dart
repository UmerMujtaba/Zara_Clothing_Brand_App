import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:zara/model/cart.dart';
import 'package:zara/user_side/components/app_bar.dart';
import 'package:zara/user_side/components/textss.dart';
import 'package:zara/user_side/screens/payment_screen.dart';

import '../../model/user.dart';

import '../../web_admin_panel/constants.dart';
import '../components/constants.dart';
import '../components/gesture_detector.dart';
import '../components/cart_tile.dart';
import '../components/drawer.dart';
import '../components/line.dart';
import '../components/toasts.dart';
import 'add_shipping_address.dart';

enum CheckoutStep {
  cartItems,
  shippingAddress,
  finalCheckOut,
}

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  CheckoutStep currentStep = CheckoutStep.cartItems;

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    final totalPrice = ref
        .watch(cartProvider.notifier.select((notifier) => notifier.totalPrice));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const myAppbar(),
      drawer: const MyTabbedDrawer(),
      body: currentStep == CheckoutStep.cartItems
          ? cart_items_case_checkout(
              cart: cart,
              totalPrice: totalPrice,
              onProceed: () {
                setState(() {
                  currentStep = CheckoutStep.shippingAddress;
                });
              },
            )
          : currentStep == CheckoutStep.shippingAddress
              ? shipping_address_case_checkout(
                  onProceed: () {
                    setState(() {
                      currentStep = CheckoutStep.finalCheckOut;
                    });
                  },
                )
              : currentStep == CheckoutStep.finalCheckOut
                  ? const final_checkout_case_checkout()
                  : Container(),
    );
  }
}

class cart_items_case_checkout extends StatefulWidget {
  const cart_items_case_checkout({
    super.key,
    required this.cart,
    required this.totalPrice,
    required this.onProceed,
  });

  final List<CartItem> cart;
  final double totalPrice;
  final VoidCallback onProceed;

  @override
  State<cart_items_case_checkout> createState() =>
      _cart_items_case_checkoutState();
}

class _cart_items_case_checkoutState extends State<cart_items_case_checkout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      const Gap(40),
                      TextWidget(
                        size: 24,
                        text: checkOut,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontFamily: 'TenorSans',
                      ),
                      CustomPaint(
                        size: const Size(200, 50), // Adjust size as needed
                        painter: LineWithDiamondPainter(
                            lineColor:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),

                      // List of cart items
                      if (widget.cart.isEmpty)
                        Center(
                          child: Text(
                            cartIsEmpty,
                            style: TextStyle(
                              fontFamily: 'TenorSans',
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 16,
                            ),
                          ),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.cart.length,
                          itemBuilder: (context, index) {
                            final cartItem = widget.cart[index];
                            return MyCartTile(cartItem: cartItem);
                          },
                        ),
                      CustomPaint(
                        size: const Size(300, 40), // Adjust size as needed
                        painter: LineWithDiamondPainter(
                            lineColor:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Icon(
                              Icons.local_activity_outlined,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          const Gap(20),
                          GestureDetector(
                            onTap: () {},
                            child: TextWidget(
                              size: 16,
                              text: addPromoCode,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontFamily: 'TenorSans',
                            ),
                          )
                        ],
                      ),
                      CustomPaint(
                        size: const Size(300, 40), // Adjust size as needed
                        painter: LineWithDiamondPainter(
                            lineColor:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Icon(
                                  Icons.local_mall_outlined,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                              const Gap(20),
                              GestureDetector(
                                onTap: () {},
                                child: TextWidget(
                                  size: 16,
                                  text: delivery,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontFamily: 'TenorSans',
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: TextWidget(
                              size: 15,
                              text: free,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontFamily: 'TenorSans',
                            ),
                          )
                        ],
                      ),
                      CustomPaint(
                        size: const Size(300, 40), // Adjust size as needed
                        painter: LineWithDiamondPainter(
                            lineColor: Theme.of(context)
                                .colorScheme
                                .inversePrimary
                                .withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (widget.cart.isEmpty) const Spacer(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    size: 18,
                    text: 'EST. TOTAL:',
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontFamily: 'TenorSans',
                  ),
                  TextWidget(
                    size: 18,
                    text: 'Rs ${widget.totalPrice}',
                    color: Colors.orangeAccent,
                    fontFamily: 'TenorSans',
                  ),
                ],
              ),
            ),
            const Gap(20),
            GestureDetector(
              onTap: () {
                if (widget.cart.isEmpty) {
                  toastBasicRed('Cart is Empty');
                } else {
                  // Move to the next step or checkout based on the current step
                  widget.onProceed();
                }
              },
              child: RandomGestureDetector(
                icon: Icons.shopping_bag_outlined,
                name: 'CHECKOUT',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

final userProvider = StreamProvider<UserModel>((ref) {
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    throw Exception("No user is currently signed in.");
  }

  print('Fetching user data for UID: ${user.uid}');
  return FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .snapshots()
      .map((snapshot) {
    if (!snapshot.exists) {
      throw Exception("User document does not exist.");
    }

    return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
  });
});

// Define a provider for cart total price (example)
class shipping_address_case_checkout extends ConsumerStatefulWidget {
  final VoidCallback onProceed;

  shipping_address_case_checkout({super.key, required this.onProceed});

  @override
  ConsumerState<shipping_address_case_checkout> createState() =>
      _ShippingAddressCaseCheckoutState();
}

class _ShippingAddressCaseCheckoutState
    extends ConsumerState<shipping_address_case_checkout> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    // Listen to the userProvider to get the user data
    final userAsyncValue = ref.watch(userProvider);

    // Listen to the cartProvider for cart data
    final cart = ref.watch(cartProvider);
    final totalPrice = ref
        .watch(cartProvider.notifier.select((notifier) => notifier.totalPrice));

    return Scaffold(
      body: userAsyncValue.when(
        data: (user) {
          // Formatting address
          String formattedAddress =
              user.addresses != null && user.addresses!.isNotEmpty
                  ? [
                      user.addresses!.first['address'] ?? '',
                      user.addresses!.first['city'] ?? '',
                      user.addresses!.first['state'] ?? '',
                      user.addresses!.first['zipCode'] ?? '',
                    ].where((element) => element.isNotEmpty).join(', ')
                  : 'No address available';

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(children: [
                          const Gap(40),
                          TextWidget(
                            size: 24,
                            text: 'Checkout',
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontFamily: 'TenorSans',
                          ),
                          CustomPaint(
                            size: const Size(200, 50), // Adjust size as needed
                            painter: LineWithDiamondPainter(
                                lineColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                          ),
                          Row(
                            children: [
                              TextWidget(
                                size: 20,
                                text: 'SHIPPING ADDRESS',
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontFamily: 'TenorSans',
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${user.name}',
                                  style: TextStyle(
                                    fontFamily: 'TenorSans',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  formattedAddress.isEmpty
                                      ? 'No address available'
                                      : formattedAddress,
                                  style: TextStyle(
                                    fontFamily: 'TenorSans',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.visible,
                                  softWrap: true, // Allow text to wrap
                                ),
                                Text(
                                  '${user.phoneNo ?? 'N/A'}',
                                  style: TextStyle(
                                    fontFamily: 'TenorSans',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CheckOutGestureDetector(
                              name: 'Add shipping address',
                              icon: Icons.add,
                              onTap: () {
                                Navigator.push(
                                  context, // Pass the current context directly
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddShippingAddress()),
                                );
                              }),
                          const Gap(30),
                          Row(
                            children: [
                              TextWidget(
                                size: 20,
                                text: 'SHIPPING METHOD',
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontFamily: 'TenorSans',
                              ),
                            ],
                          ),
                          const Gap(20),
                          CheckOutGestureDetector(
                            name: 'Pickup at store',
                            icon: Icons.keyboard_arrow_down_outlined,
                          ),
                          const Gap(30),
                          Row(
                            children: [
                              TextWidget(
                                size: 20,
                                text: 'PAYMENT METHOD',
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontFamily: 'TenorSans',
                              ),
                            ],
                          ),
                          const Gap(20),
                          CheckOutGestureDetector(
                            name: 'Select payment method',
                            icon: Icons.keyboard_arrow_down_outlined,
                            selectedOption: _selectedPaymentMethod,
                            options: ['Cash', 'Card'],
                            onOptionChanged: (newValue) {
                              setState(() {
                                _selectedPaymentMethod = newValue;
                                Navigator.push(
                                  context, // Pass the current context directly
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentPage()),
                                );
                              });
                            },
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(30),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          size: 18,
                          text: 'EST. TOTAL:',
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontFamily: 'TenorSans',
                        ),
                        TextWidget(
                          size: 18,
                          text: 'Rs $totalPrice',
                          color: Colors.orangeAccent,
                          fontFamily: 'TenorSans',
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  RandomGestureDetector(
                    onTap: () {
                      if (cart.isEmpty) {
                        toastBasicRed('Cart is Empty');
                      } else {
                        widget.onProceed();
                      }
                    },
                    icon: Icons.shopping_bag_outlined,
                    name: 'PLACE ORDER',
                  ),
                ],
              ),
            ],
          );
        },
        loading: () => const Center(child: const CircularProgressIndicator()),
        error: (e, stack) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class final_checkout_case_checkout extends ConsumerStatefulWidget {
  const final_checkout_case_checkout({super.key});

  @override
  ConsumerState<final_checkout_case_checkout> createState() =>
      _final_checkout_case_checkoutState();
}

class _final_checkout_case_checkoutState
    extends ConsumerState<final_checkout_case_checkout> {
  @override
  Widget build(BuildContext context) {
    final userAsyncValue = ref.watch(userProvider);

    // Listen to the cartProvider for cart data
    final cart = ref.watch(cartProvider);
    final totalPrice = ref
        .watch(cartProvider.notifier.select((notifier) => notifier.totalPrice));

    return Scaffold(
      // appBar: const myAppbar(),
      // drawer: const MyTabbedDrawer(),
      body: userAsyncValue.when(
        data: (user) {
          String formattedAddress =
              user.addresses != null && user.addresses!.isNotEmpty
                  ? [
                      user.addresses!.first['address'] ?? '',
                      user.addresses!.first['city'] ?? '',
                      user.addresses!.first['state'] ?? '',
                      user.addresses!.first['zipCode'] ?? '',
                    ].where((element) => element.isNotEmpty).join(', ')
                  : 'No address available';

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              const Gap(40),
                              TextWidget(
                                size: 24,
                                text: 'Checkout',
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontFamily: 'TenorSans',
                              ),
                              CustomPaint(
                                size: const Size(200, 50),
                                // Adjust size as needed
                                painter: LineWithDiamondPainter(
                                  lineColor: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${user.name}',
                                      style: TextStyle(
                                        fontFamily: 'TenorSans',
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      formattedAddress.isEmpty
                                          ? 'No address available'
                                          : formattedAddress,
                                      style: TextStyle(
                                        fontFamily: 'TenorSans',
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.visible,
                                      softWrap: true, // Allow text to wrap
                                    ),
                                    Text(
                                      '${user.phoneNo ?? 'N/A'}',
                                      style: TextStyle(
                                        fontFamily: 'TenorSans',
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, stack) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
