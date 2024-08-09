import 'package:flutter/material.dart';
import '../model/item_model.dart';

class ItemContainer extends StatelessWidget {
  final ItemModel item;

  const ItemContainer({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Image(
            image: AssetImage(item.imageUrl), // Using AssetImage
            fit: BoxFit.fitHeight,
          ),
        ),

        Text(
          item.tag!,
          style: const TextStyle(),
          textAlign: TextAlign.center,

          // Handle overflow
        ),
        Text(
          item.name,
          style: const TextStyle(),
          textAlign: TextAlign.center,

          // Handle overflow
        ),
        Text(
          item.price,
          style:
              const TextStyle(fontWeight: FontWeight.w400, color: Colors.red),
        ),
      ],
    );
  }
}
