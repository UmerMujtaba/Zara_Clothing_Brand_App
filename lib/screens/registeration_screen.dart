import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:zaraclothingbrand/screens/login_screen.dart';
import '../components/button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({
    super.key,
  });

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> signup() async {
    try {
      // Create a new user with email and password
      final UserCredential newUser = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (newUser.user != null) {
        // Registration successful, navigate to the login screen or show a success message
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(
              verificationId: '',
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('The password provided is too weak.')),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('The account already exists for that email.')),
        );
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('The email address is invalid.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: ${e.message}')),
        );
      }
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
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    //final Orientation orientation = MediaQuery.of(context).orientation;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SizedBox(
          height: screenHeight * 0.9,
          width: screenWidth * 1,
          child: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: const Text(
                      'WELCOME!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontFamily: 'TenorSans',
                          letterSpacing: 2),
                    ),
                  ),
                  SizedBox(
                    //color: Colors.red,
                    height: screenHeight * 0.2,
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[600],
                        maxRadius: 50,
                        child: const Icon(
                          Icons.person_rounded,
                          size: 90,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Add profile picture',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'TenorSans'),
                  ),
                  SizedBox(
                    height: screenHeight * 0.45,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 20),

                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(35, 0, 0, 5),
                                child: Text(
                                  'Name',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: 'TenorSans'),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.text_fields, size: 24),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Enter Name',
                              ),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                            ),
                          ),

                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(35, 5, 0, 0),
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: 'TenorSans'),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              // obscureText: true,
                              enableSuggestions: true,
                              controller: _emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.email, size: 24),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Enter Email',
                              ),

                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                            ),
                          ),
                          // const SizedBox(height: 15),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(35, 5, 0, 0),
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: 'TenorSans'),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            child: TextField(
                              obscureText: _obscureText,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock, size: 24),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Enter Password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 1,
                    height: screenHeight * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: 'LOGIN',
                          height: 44.0,
                          onPressed: () async {
                            // setState(() {
                            //   showSpinner = true;
                            // });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) =>
                                        LoginScreen(verificationId: '')));
                          },
                        ),
                        const SizedBox(width: 20),
                        CustomButton(
                          text: 'REGISTER',
                          height: 44.0,
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            signup();
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
