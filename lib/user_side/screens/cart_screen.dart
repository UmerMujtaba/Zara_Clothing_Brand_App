import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import fluttertoast package
import 'package:zara/model/cart.dart';
import 'package:zara/user_side/components/textss.dart';
import 'package:zara/user_side/screens/payment_screen.dart';
import '../../providers/providers.dart';
import '../components/button.dart';
import '../components/constants.dart';
import '../components/quantity_selector.dart';
import '../components/toasts.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(
            size: 22,
            text: 'C A R T',
            color: Theme.of(context).colorScheme.inversePrimary,
            fontFamily: 'TenorSans'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: TextWidget(
                    size: 20,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    text: areYouSureYouWantToEmptyCart,
                    fontFamily: 'TenorSans',
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: TextWidget(
                          size: 14,
                          text: cancel,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        )),
                    TextButton(
                        onPressed: () {
                          ref.read(cartProvider.notifier).clearCart();
                          Navigator.pop(context);
                        },
                        child: TextWidget(
                          size: 14,
                          text: yes,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        )),
                  ],
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          // List of cart items
          Expanded(
            child: cart.isEmpty
                ? Center(
                    child: Text(
                    'Cart is empty..',
                    style: TextStyle(
                        fontFamily: 'TenorSans',
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16),
                  ))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final cartItem = cart[index];

                      return MyCartTile(cartItem: cartItem);
                    },
                  ),
          ),
          MyButton(
            text: goToCheckout,
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
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}

class MyCartTile extends ConsumerWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      leading: Image.network(
        cartItem.product.imageUrl,
        fit: BoxFit.cover,
      ),
      title: TextWidget(
        size: 16,
        text: cartItem.product.name,
        color: Theme.of(context).colorScheme.inversePrimary,
        fontFamily: 'TenorSans',
      ),
      subtitle: Text(
        'Color: ${cartItem.color}\nSize: ${cartItem.size}\nQuantity: ${cartItem.quantity}\nPrice: ${cartItem.totalPrice}',
        style: TextStyle(
          fontFamily: 'TenorSans',
          fontSize: 14,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyQuantitySelector(cartItem: cartItem),
          IconButton(
            icon: Icon(
              Icons.remove_shopping_cart,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            onPressed: () {
              ref.read(cartProvider.notifier).removeItem(cartItem);
            },
          ),
        ],
      ),
    );
  }
}
