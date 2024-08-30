import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zara/model/cart.dart';

class MyQuantitySelector extends ConsumerWidget {
  const MyQuantitySelector({
    super.key,
    required this.cartItem,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            if (cartItem.quantity > 1) {
              ref
                  .read(cartProvider.notifier)
                  .updateQuantity(cartItem, cartItem.quantity - 1);
            }
          },
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Icon(
              Icons.remove,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            cartItem.quantity.toString(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 16,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            ref
                .read(cartProvider.notifier)
                .updateQuantity(cartItem, cartItem.quantity + 1);
          },
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}
