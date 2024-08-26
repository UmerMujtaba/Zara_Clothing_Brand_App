import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import 'constants.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({super.key});

  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> _sendEmail() async {
    final String emailAddress = _emailController.text.trim();

    if (emailAddress.isEmpty) {
      // Show an error if email is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(pleaseEnterAnEmail)),
      );
      return;
    }

    final Email email = Email(
      body: 'Hello! This is a test email.',
      subject: 'Test Email',
      recipients: [emailAddress],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(emailSentSuccess)),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$failedToSendEmail: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: hintText,
              border: UnderlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _sendEmail,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Black button background
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0), // Rectangular shape
              ),
              padding: const EdgeInsets.symmetric(vertical: 16), // Button padding
            ),
            child: const Text(
              submit,
              style: TextStyle(
                fontFamily: 'TenorSans',
                color: Colors.white, // White text color
              ),
            ),
          ),
        ],
      ),
    );
  }
}

