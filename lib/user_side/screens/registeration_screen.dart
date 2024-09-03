import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/user.dart';
import '../../theme/theme_provider.dart';
import '../components/button.dart';
import '../components/constants.dart';
import '../components/textfields.dart';
import 'login_screen.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({
    super.key,
  });

  @override
  ConsumerState<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
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
        // Get FCM token
        final fcmToken = await FirebaseMessaging.instance.getToken();

        // Create a new UserModel
        final userModel = UserModel(
          id: newUser.user!.uid,
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          fcmToken: fcmToken,
        );

        // Store the user data in Firestore or any other database
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userModel.id)
            .set(userModel.toMap());

        //saving name in shared preferences
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('username', _nameController.text);

        // Registration successful, navigate to the login screen or show a success message
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(verificationId: ''),
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
          SnackBar(content: Text('An new occurred: ${e.message}')),
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
    final themeNotifier = ref.read(themeNotifierProvider.notifier);
    final themeData = ref.watch(themeNotifierProvider);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Text(
                    welcome,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
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
                Text(
                  addProfilePic,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'TenorSans',
                      letterSpacing: 1),
                ),
                SizedBox(
                  height: screenHeight * 0.45,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 1,
                                  fontFamily: 'TenorSans'),
                            ),
                          ],
                        ),
                        CustomTextField(
                          controller: _nameController,
                          hintText: hintText4,
                          prefixIcon: Icon(
                            Icons.text_fields_outlined,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          obscureText: false,
                          keyboardType: TextInputType.text,
                        ),
                        const Gap(20),
                        Row(
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 1,
                                  fontFamily: 'TenorSans'),
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
                        const Gap(20),
                        Row(
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 1,
                                  fontFamily: 'TenorSans'),
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
                            color: Theme.of(context).colorScheme.inversePrimary,
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
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButtonWidget(
                          text: loginText,
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
                      ),
                      const Gap(20),
                      Expanded(
                        child: ElevatedButtonWidget(
                          text: register,
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            signup();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
