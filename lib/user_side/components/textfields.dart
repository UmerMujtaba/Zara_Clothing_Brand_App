import 'package:flutter/material.dart';

import 'constants.dart';

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
      {Key? key,
      required this.controller,
      this.hintText,
      this.prefixIcon,
      this.keyboardType,
      this.obscureText = false,
      this.suffixIcon, // Default value is false
      this.readOnly = false,
      this.textCapitalization=TextCapitalization.none})
      : super(key: key);

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
        filled: true,
        fillColor: Colors.white,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueGrey, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: hintText,
      ),
      style: const TextStyle(color: Colors.black, fontSize: 14),
    );
  }
}
