import 'package:flutter/material.dart';

class RandomGestureDetector extends StatelessWidget {
  final String? name;
  final IconData? icon;

  RandomGestureDetector({
    super.key,
    this.name,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.secondary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Text(name!,
                style: TextStyle(
                  fontFamily: 'TenorSans',
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )),
          ],
        ));
  }
}
