// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCMdJNssZWmHH8eh_XxxThuMPq2brnAns0',
    appId: '1:431058441641:web:46147334b59eda2b0e20b8',
    messagingSenderId: '431058441641',
    projectId: 'ecommerceapp-25400',
    authDomain: 'ecommerceapp-25400.firebaseapp.com',
    storageBucket: 'ecommerceapp-25400.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBsQTv7pMgI3hbkcydhszgZa_8sKhQnDxA',
    appId: '1:431058441641:android:4576b71f3c5fda920e20b8',
    messagingSenderId: '431058441641',
    projectId: 'ecommerceapp-25400',
    storageBucket: 'ecommerceapp-25400.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2G197IgwibOmCIZ5y0ztzzyFr2Mfqf0o',
    appId: '1:431058441641:ios:c56e8575406ddbe70e20b8',
    messagingSenderId: '431058441641',
    projectId: 'ecommerceapp-25400',
    storageBucket: 'ecommerceapp-25400.appspot.com',
    iosBundleId: 'com.example.zara',
  );
}
