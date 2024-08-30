import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import fluttertoast package
import 'package:gap/gap.dart';
import 'package:zara/model/cart.dart';
import 'package:zara/user_side/components/app_bar.dart';
import 'package:zara/user_side/components/textss.dart';
import 'package:zara/user_side/screens/payment_screen.dart';
import '../../model/product.dart';
import '../../providers/providers.dart';
import '../components/gesture_detector.dart';
import '../components/button.dart';
import '../components/cart_tile.dart';
import '../components/constants.dart';
import '../components/drawer.dart';
import '../components/line.dart';
import '../components/quantity_selector.dart';
import '../components/toasts.dart';

class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final totalPrice = ref
        .watch(cartProvider.notifier.select((notifier) => notifier.totalPrice));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: myAppbar(),
      drawer: const MyTabbedDrawer(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Gap(40),
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
                        if (cart.isEmpty)
                          Center(
                            child: Text(
                              cartIsEmpty,
                              style: TextStyle(
                                fontFamily: 'TenorSans',
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontSize: 16,
                              ),
                            ),
                          )
                        else
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: cart.length,
                            itemBuilder: (context, index) {
                              final cartItem = cart[index];
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
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                            Gap(20),
                            GestureDetector(
                              onTap: () {},
                              child: TextWidget(
                                size: 16,
                                text: addPromoCode,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
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
                                Gap(20),
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
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
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
          if (cart.isEmpty) Spacer(),
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
                      text: 'Rs ${totalPrice}',
                      color: Colors.orangeAccent,
                      fontFamily: 'TenorSans',
                    ),
                  ],
                ),
              ),
              Gap(20),
              GestureDetector(
                onTap: () {
                  if (cart.isEmpty) {
                    // Show toast if the cart is empty
                    toastBasicRed('Cart is Empty');
                  } else {
                    // Navigate to payment page if the cart is not empty
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentPage(),
                      ),
                    );
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
      ),
    );
  }
}
