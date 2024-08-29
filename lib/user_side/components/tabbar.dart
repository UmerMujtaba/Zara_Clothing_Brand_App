import 'package:flutter/material.dart';

class TabbarExample extends StatelessWidget implements PreferredSizeWidget {
  const TabbarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelStyle: TextStyle(fontFamily: 'TenorSans'),
      labelColor: Theme.of(context).colorScheme.inversePrimary,
      tabs: [
        Tab(
          text: "All",
        ),
        Tab(
          text: "Apparel",
        ),
        Tab(
          text: "Jackets",
        ),
        Tab(
          text: "Bags",
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
