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
            color: Colors.transparent.withOpacity(0.5),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
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
          border: Border.all(width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: const TextStyle(fontFamily: 'TenorSans'),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.add,
                size: 15,
                color: Colors.black,
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
        backgroundColor: Colors.black,
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
        style: const TextStyle(
          fontFamily: 'TenorSans',
          color: Colors.white, // Set text color to white for contrast
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  final String text; //to be changed depending on use
  final double height; //to be changed depending on use
  final EdgeInsets padding; //to be changed depending on use
  final VoidCallback onPressed; //to be changed depending on use

  const CustomButton({
    super.key,
    required this.text,
    this.height =
    44.0, //const provided, if nt given in any screen it will be called there
    this.padding = const EdgeInsets.fromLTRB(40, 10, 40, 10),
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.blueGrey],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, letterSpacing: 2,fontFamily: 'TenorSans'),
        ),
      ),
    );
  }
}