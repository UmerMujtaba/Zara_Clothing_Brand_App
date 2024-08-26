import 'package:flutter/material.dart';

class TabbarExample extends StatelessWidget implements PreferredSizeWidget {
  const TabbarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      labelStyle: TextStyle(fontFamily : 'TenorSans'),
      labelColor: Colors.black,
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
