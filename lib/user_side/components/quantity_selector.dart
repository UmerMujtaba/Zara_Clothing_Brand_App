// import 'package:flutter/material.dart';
//
// class MyQuantitySelector extends StatelessWidget {
//   const MyQuantitySelector(
//       {super.key,
//       required this.quantity,
//       required this.food,
//       required this.onIncrement,
//       required this.onDecrement});
//
//   final int quantity;
//   final Food food;
//   final VoidCallback onIncrement;
//   final VoidCallback onDecrement;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.surface,
//         borderRadius: BorderRadius.circular(50),
//       ),
//       padding: const EdgeInsets.all(8),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           GestureDetector(
//             onTap: onDecrement,
//             child: Icon(
//               Icons.remove,
//               color: Theme.of(context).colorScheme.primary,
//               size: 20,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5),
//             child: SizedBox(
//               width: 20,
//               child: Center(
//                 child: Text(
//                   quantity.toString(),
//                 ),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: onIncrement,
//             child: Icon(
//               Icons.add,
//               color: Theme.of(context).colorScheme.primary,
//               size: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
