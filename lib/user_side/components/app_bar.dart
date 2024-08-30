import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zara/user_side/screens/check_out_screen.dart';
import '../../model/cart.dart';
import '../../providers/providers.dart';
import '../screens/cart_screen.dart';

//${cartItem.totalPrice}
class myAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const myAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemCount = ref.watch(cartProvider).length;
    bool isDarkBackground =
        Theme.of(context).colorScheme.surface.computeLuminance() < 0.5;

    // Choose the image based on the background color
    String imageAsset = isDarkBackground
        ? 'assets/images/Logo (2).png' // Image for dark backgrounds
        : 'assets/images/Logo (1).png';

    return AppBar(
      // automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Image.asset(
        imageAsset,
        filterQuality: FilterQuality.high,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            // Implement search functionality here
          },
          icon: const Icon(Icons.search_outlined),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_bag_outlined),
            ),
            if (cartItemCount > 0)
              Positioned(
                right: 7,
                top: 7,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    '$cartItemCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
