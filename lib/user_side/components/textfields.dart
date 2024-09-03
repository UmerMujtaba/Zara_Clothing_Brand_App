import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Icon? prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool readOnly;
  final TextCapitalization? textCapitalization;

  const CustomTextField(
      {super.key,
      required this.controller,
      this.hintText,
      this.prefixIcon,
      this.keyboardType,
      this.obscureText = false,
      this.suffixIcon, // Default value is false
      this.readOnly = false,
      this.textCapitalization = TextCapitalization.none});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly,
      textCapitalization: TextCapitalization.sentences,
      // Use the obscureText parameter
      decoration: InputDecoration(
          filled: false,
          fillColor: Theme.of(context).colorScheme.inversePrimary,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.inversePrimary,
                width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontStyle: FontStyle.italic,
              fontSize: 12,
              fontWeight: FontWeight.w300,
              fontFamily: 'TenorSans')),
      style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary, fontSize: 14),
    );
  }
}

class CustomTextField2 extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Icon? prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool readOnly;
  final TextCapitalization? textCapitalization;

  const CustomTextField2(
      {super.key,
      required this.controller,
      this.hintText,
      this.prefixIcon,
      this.keyboardType,
      this.obscureText = false,
      this.suffixIcon, // Default value is false
      this.readOnly = false,
      this.textCapitalization = TextCapitalization.none});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly,
      textCapitalization: TextCapitalization.sentences,
      // Use the obscureText parameter
      decoration: InputDecoration(
          filled: false,
          fillColor: Theme.of(context).colorScheme.inversePrimary,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            //borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.inversePrimary,
                width: 1.0),
            //borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
            //borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              //fontStyle: FontStyle.italic,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              fontFamily: 'TenorSans')),
      style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary, fontSize: 14),
    );
  }
}
