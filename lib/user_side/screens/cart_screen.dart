import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zara/model/cart.dart';
import 'package:zara/user_side/components/textss.dart';
import 'package:zara/user_side/screens/payment_screen.dart';
import '../../providers/providers.dart';
import '../components/button.dart';
import '../components/constants.dart';
import '../components/quantity_selector.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(
            size: 22,
            text: 'C A R T',
            color: Colors.black,
            fontFamily: 'TenorSans'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: TextWidget(
                    size: 20,
                    color: Colors.black,
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
                          color: Colors.grey,
                        )),
                    TextButton(
                        onPressed: () {
                          ref.read(cartProvider.notifier).clearCart();
                          Navigator.pop(context);
                        },
                        child: TextWidget(
                          size: 14,
                          text: yes,
                          color: Colors.grey,
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
                ? const Center(child: Text('Cart is empty..'))
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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PaymentPage(),
              ),
            ),
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
      leading: // Adjust the height as needed
          Image.network(
        cartItem.product.imageUrl,
        fit: BoxFit.cover,
      ),
      title: TextWidget(
        size: 16,
        text: cartItem.product.name,
        color: Colors.black,
        fontFamily: 'TenorSans',
      ),
      subtitle: Text(
        'Color: ${cartItem.color}\nSize: ${cartItem.size}\nQuantity: ${cartItem.quantity}\nPrice: ${cartItem.totalPrice}',
        // Assuming Product has price
        style: TextStyle(fontFamily: 'TenorSans', fontSize: 14),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyQuantitySelector(cartItem: cartItem),
          IconButton(
            icon: const Icon(Icons.remove_shopping_cart),
            onPressed: () {
              ref.read(cartProvider.notifier).removeItem(cartItem);
            },
          ),
        ],
      ),
    );
  }
}
