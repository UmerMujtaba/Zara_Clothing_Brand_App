import 'package:flutter/material.dart';

class TabbarExample extends StatelessWidget implements PreferredSizeWidget {
  const TabbarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: [
        Tab(
          text: "All",
        ),
        Tab(
          text: "Apparel",
        ),
        Tab(
          text: "Dress",
        ),
        Tab(
          text: "Bag",
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
