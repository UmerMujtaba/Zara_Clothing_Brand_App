import 'package:flutter/material.dart';

class AddToBasket extends StatelessWidget {
  const AddToBasket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                Text('ADD TO BASKET',
                    style: TextStyle(
                        fontFamily: 'TenorSans', color: Colors.white)),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}
