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
    return Container(
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .colorScheme
            .tertiary,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              if (cartItem.quantity > 1) {
                ref.read(cartProvider.notifier).updateQuantity(
                    cartItem, cartItem.quantity - 1);
              }
            },
            child: Icon(
              Icons.remove,
              color: Theme
                  .of(context)
                  .colorScheme
                  .inversePrimary,
              size: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              width: 25, // Adjust the width as needed
              child: Center(
                child: Text(
                  cartItem.quantity.toString(),
                  style: TextStyle(color: Theme
                      .of(context)
                      .colorScheme
                      .inversePrimary,),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              ref.read(cartProvider.notifier).updateQuantity(
                  cartItem, cartItem.quantity + 1);
            },
            child: Icon(
              Icons.add,
              color: Theme
                  .of(context)
                  .colorScheme
                  .inversePrimary,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
