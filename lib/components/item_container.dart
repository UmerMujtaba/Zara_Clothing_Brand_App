import 'package:flutter/material.dart';
import '../model/item_model.dart';

class ItemContainer extends StatelessWidget {
  final ItemModel item;

  const ItemContainer({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image(
              image:
                 AssetImage(item.imageUrl),  // Using AssetImage
                fit: BoxFit.fitHeight,

            ),
          ),
        const SizedBox(height: 8),  // Add some spacing
        // Wrap text in a Flexible widget if needed
        SizedBox(
          width: double.infinity,
          child: Text(

            item.name,
            style: const TextStyle(),
            textAlign: TextAlign.center,

            // Handle overflow
          ),
        ),
        Text(
          item.price,
          style: const TextStyle(fontWeight: FontWeight.w400,color: Colors.red),
        ),

      ],
    );
  }
}
