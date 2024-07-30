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
            style: TextStyle(
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
  const Mybutton2({Key? key, this.onTap, required this.text}) : super(key: key);
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
                style: TextStyle(fontFamily: 'TenorSans'),
              ),
              SizedBox(width: 5),
              Icon(
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
