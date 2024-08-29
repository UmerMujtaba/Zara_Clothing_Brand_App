import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 60),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
                letterSpacing: 3,
                fontFamily: 'TenorSans',
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class Mybutton2 extends StatelessWidget {
  const Mybutton2({super.key, this.onTap, required this.text});

  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'TenorSans',
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                Icons.add,
                size: 15,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button3 extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const Button3({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        // Set the background color to black
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              0), // Set border radius to 0 for a rectangle
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 12), // Adjust padding as needed
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'TenorSans',
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}

// class CustomButton extends StatelessWidget {
//   final String text;
//
//   final VoidCallback onPressed;
//
//   const CustomButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
//         margin: const EdgeInsets.symmetric(horizontal: 10),
//         decoration: BoxDecoration(
//           color: Colors.transparent.withOpacity(0.8),
//           // Update this to a non-transparent color for better visibility
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: ElevatedButton(
//           onPressed: onPressed,
//           style: ElevatedButton.styleFrom(
//             color: Colors.transparent.withOpacity(0.8),
//
//           ),
//           child: Text(
//             text,
//             style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//                 letterSpacing: 3,
//                 fontFamily: 'TenorSans',
//                 fontSize: 18),
//           ),
//         ),
//       ),
//     );
//   }
// }

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        // Set the background color of the button
        minimumSize: Size(double.infinity, 40),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontFamily: 'TenorSans',
            fontSize: 18), // Set the text color of the button
      ),
    );
  }
}

class MyButton4 extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton4({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
