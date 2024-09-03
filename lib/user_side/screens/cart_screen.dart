import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:zara/user_side/components/app_bar.dart';
import 'package:zara/user_side/components/constants.dart';
import 'package:zara/user_side/components/drawer.dart';
import 'package:zara/user_side/components/textss.dart';
import 'package:zara/user_side/screens/new_arrival.dart';
import '../../model/cart.dart';
import '../components/gesture_detector.dart';
import '../components/cart_tile.dart';
import '../components/line.dart';
import 'check_out_screen.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final totalPrice = ref
        .watch(cartProvider.notifier.select((notifier) => notifier.totalPrice));

    return Scaffold(
      appBar: const myAppbar(),
      drawer: const MyTabbedDrawer(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        const Gap(30),
                        Row(
                          children: [
                            TextWidget(
                              text: 'CART',
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              size: 22,
                              fontFamily: 'TenorSans',
                            ),
                          ],
                        ),
                        if (cart.isEmpty)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: TextWidget(
                                text: youHaveNoItemsInYourShoppingBag,
                                fontFamily: 'TenorSans',
                                size: 16,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                          )
                        else
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cart.length,
                            itemBuilder: (context, index) {
                              final cartItem = cart[index];
                              return MyCartTile(cartItem: cartItem);
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (cart.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  CustomPaint(
                    size: const Size(300, 40), // Adjust size as needed
                    painter: LineWithDiamondPainter(
                        lineColor:
                            Theme.of(context).colorScheme.inversePrimary),
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        size: 18,
                        text: 'SUBTOTAL:',
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
                  const Gap(10),
                  const Gap(10),
                  TextWidget(
                    size: 14,
                    text:
                        '*Shipping charges, taxes and discount codes are calculated at the time of accounting.',
                    color: Theme.of(context)
                        .colorScheme
                        .inversePrimary
                        .withOpacity(0.6),
                    fontFamily: 'TenorSans',
                  ),
                  const Gap(10),
                ],
              ),
            ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  if (cart.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckoutScreen(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewArrival(),
                      ),
                    );
                  }
                },
                child: RandomGestureDetector(
                  icon: Icons.shopping_bag_outlined,
                  name: cart.isEmpty ? 'CONTINUE SHOPPING' : 'BUY NOW',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
