import 'package:flutter/material.dart';

class RandomGestureDetector extends StatelessWidget {
  final String? name;

  RandomGestureDetector({
    super.key,
    this.name,
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
                Icons.add,
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
