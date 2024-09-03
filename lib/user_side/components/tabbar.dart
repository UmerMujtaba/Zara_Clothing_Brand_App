import 'package:flutter/material.dart';

class TabbarExample extends StatelessWidget implements PreferredSizeWidget {
  const TabbarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelStyle: const TextStyle(fontFamily: 'TenorSans'),
      labelColor: Theme.of(context).colorScheme.inversePrimary,
      tabs: [
        const Tab(
          text: "All",
        ),
        const Tab(
          text: "Apparel",
        ),
        const Tab(
          text: "Jackets",
        ),
        const Tab(
          text: "Bags",
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
