import 'package:flutter/material.dart';

import 'constants.dart';

class TextFields extends StatelessWidget {
  const TextFields({
    super.key,
    required TextEditingController emailController, required this.hintText,

  }): _emailController = emailController;

  final TextEditingController _emailController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      // obscureText: true,
      enableSuggestions: true,
      controller: _emailController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.email, size: 24),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: hintText,
      ),

      style: const TextStyle(color: Colors.black, fontSize: 14),
    );
  }
}
