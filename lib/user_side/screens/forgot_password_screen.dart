import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../components/app_bar.dart';
import '../components/button.dart';
import '../components/constants.dart';
import '../components/textfields.dart';
import '../components/textss.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future PasswordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Password reset link send! Check your email address'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(e.message.toString()),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppbar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 30, 25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextWidget(
                    size: 26,
                    text: brandName,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,fontFamily: 'TenorSans',),
                const SizedBox(height: 20),
                TextWidget(
                    size: 16,
                    text: enterTheEmailAddress,
                    color: Colors.black,
                    textAlign: TextAlign.center,fontFamily: 'TenorSans',),
                const SizedBox(height: 15),
                Row(
                  children: [
                    TextWidget(
                        size: 14,
                        text: 'Email',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,fontFamily: 'TenorSans',),
                  ],
                ),
                Gap(20),
                CustomTextField(
                  controller: _emailController,
                  hintText: hintText,
                ),
                const SizedBox(height: 30),
                ElevatedButtonWidget(
                    onPressed: PasswordReset, text: 'Send Email')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
