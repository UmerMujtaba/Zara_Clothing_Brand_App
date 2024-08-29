import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zara/user_side/components/textss.dart';
import 'package:zara/user_side/screens/registeration_screen.dart';

import '../../model/user.dart';
import '../components/button.dart';
import '../components/constants.dart';
import '../components/textfields.dart';
import 'forgot_password_screen.dart';
import 'homepage.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  String verificationId;

  // final VoidCallback showRegisterPage;

  LoginScreen({
    super.key,
    required this.verificationId,
    // required this.showRegisterPage
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  bool _obscureText = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> login() async {
    setState(() {
      showSpinner = true;
    });

    try {
      // Sign in the user with email and password
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (userCredential.user != null) {
        // Get FCM token
        final fcmToken = await FirebaseMessaging.instance.getToken();

        // Retrieve the user data from Firestore
        DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore
            .instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();

        if (userDoc.exists) {
          // Update FCM token in Firestore
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user!.uid)
              .update({'fcmToken': fcmToken});

          // Optionally, you can create a UserModel instance here
          final userModel = UserModel.fromMap(userDoc.data()!);
          userModel.fcmToken = fcmToken; // Update the local instance

          // Store the email in SharedPreferences
          final SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString('email', _emailController.text.trim());
          //sharedPreferences.setString('key', value)

          // Navigate to the home screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MyHomePage(), // Replace with your home screen
            ),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      String errorMessage = 'An unexpected error occurred.';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is invalid.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      debugPrint(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An unexpected error occurred.')),
      );
    } finally {
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SizedBox(
        height: screenHeight * 0.9,
        width: screenWidth * 1,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextWidget(
                size: 32,
                text: helloAgain,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontFamily: 'TenorSans',
                letterSpacing: 2,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  TextWidget(
                    text: email,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    size: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'TenorSans',
                  ),
                ],
              ),
              CustomTextField(
                controller: _emailController,
                hintText: hintText,
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  TextWidget(
                    size: 16,
                    text: 'PASSWORD',
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'TenorSans',
                  ),
                ],
              ),
              CustomTextField(
                controller: _passwordController,
                hintText: hintText3,
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                obscureText: _obscureText,
                keyboardType: TextInputType.text,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: TextWidget(
                        size: 12,
                        text: forgotPassword,
                        color: Colors.blueGrey,
                        fontFamily: 'TenorSans',
                      )),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButtonWidget(
                text: loginText,
                onPressed: login,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 1.0,
                    width: 80.0,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  TextWidget(
                    size: 16,
                    text: socialLogin,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'TenorSans',
                  ),
                  Container(
                    height: 1.0,
                    width: 80.0,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withOpacity(0.8),
                      borderRadius: BorderRadius.circular(50.0),
                      // color: Colors.blue,
                    ),
                    child: Icon(
                      Icons.facebook_sharp,
                      size: 40,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withOpacity(0.8),
                    ),
                    child: Icon(
                      Icons.g_mobiledata,
                      size: 40,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextWidget(
                size: 15,
                text: donothaveanaccount,
                color: Colors.blueGrey,
                fontFamily: 'TenorSans',
              ),
              Gap(20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RegistrationScreen(), // Replace with your home screen
                    ),
                  );
                },
                child: TextWidget(
                  size: 16,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  text: 'REGISTER',
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontFamily: 'TenorSans',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
