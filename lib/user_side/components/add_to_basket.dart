import 'package:flutter/material.dart';

class AddToBasket extends StatelessWidget {
  const AddToBasket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.tertiary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Text('ADD TO BASKET',
                    style: TextStyle(
                      fontFamily: 'TenorSans',
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )),
              ],
            ),
          ],
        ));
  }
}
