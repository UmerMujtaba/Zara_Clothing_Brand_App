// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zara/theme/dark_mode.dart';
import 'package:zara/theme/light_mode.dart';
import 'package:zara/theme/theme_provider.dart';
import 'package:zara/user_side/screens/homepage.dart';
import 'package:zara/user_side/screens/registeration_screen.dart';
import 'package:zara/web_admin_panel/panels_scaffolds/admin_panel.dart';
import 'package:zara/web_admin_panel/panels_scaffolds/desktop_scaffold.dart';
import 'package:zara/web_admin_panel/panels_scaffolds/mobile_scaffold.dart';
import 'package:zara/web_admin_panel/panels_scaffolds/tablet_scaffold.dart';

import '../main.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  print("FCMToken $fcmToken");
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();

    // Listen to system brightness changes
    WidgetsBinding.instance.window.onPlatformBrightnessChanged = () {
      // Update the theme when the system's brightness changes
      ref.read(themeNotifierProvider.notifier).state =
          WidgetsBinding.instance.window.platformBrightness == Brightness.dark
              ? darkMode
              : lightMode;
    };
  }

  @override
  Widget build(BuildContext context) {
    final themeData = ref.watch(themeNotifierProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: kIsWeb
          ? const AdminPanel(
              mobileScaffold: MobileScaffold(),
              tabletScaffold: TabletScaffold(),
              desktopScaffold: DesktopScaffold(),
            )
          : FutureBuilder<bool>(
              future: _checkLoginStatus(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return const Scaffold(
                    body: Center(child: Text('Error checking login status')),
                  );
                } else if (snapshot.data == true) {
                  // User is logged in
                  return MyHomePage(); // Navigate to home page
                } else {
                  // User is not logged in
                  return const RegistrationScreen(); // Show registration screen
                }
              },
            ),
    );
  }

  Future<bool> _checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');
    return email != null;
  }
}
