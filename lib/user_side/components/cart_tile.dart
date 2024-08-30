import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zara/user_side/components/quantity_selector.dart';
import 'package:zara/user_side/components/textss.dart';

import '../../model/cart.dart';

class MyCartTile extends ConsumerWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      leading: Image.network(
        cartItem.product.imageUrl,
        fit: BoxFit.cover,
      ),
      title: TextWidget(
        size: 16,
        text: cartItem.product.name.toUpperCase(),
        color: Theme.of(context).colorScheme.inversePrimary,
        letterSpacing: 1,
        fontFamily: 'TenorSans',
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cartItem.product.description,
            style: TextStyle(
              fontFamily: 'TenorSans',
              fontSize: 14,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${cartItem.size}',
            style: TextStyle(
              fontFamily: 'TenorSans',
              fontSize: 14,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Rs ${cartItem.product.price.toString()}',
            style: TextStyle(
              fontFamily: 'TenorSans',
              fontSize: 14,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          MyQuantitySelector(cartItem: cartItem),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.remove_shopping_cart,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        onPressed: () {
          ref.read(cartProvider.notifier).removeItem(cartItem);
        },
      ),
    );
  }
}
