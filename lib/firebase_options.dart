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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDUK8lKPkMhevkyaM2reo5vrcKrSAeLUuw',
    appId: '1:355154883318:web:bdd56275a65f099350f2d7',
    messagingSenderId: '355154883318',
    projectId: 'expense-calculator-cd0cd',
    authDomain: 'expense-calculator-cd0cd.firebaseapp.com',
    storageBucket: 'expense-calculator-cd0cd.appspot.com',
    measurementId: 'G-KN3RSLRJS6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDP3Gy4lzHyBaAgY_NetyC8zIOPs9h5AA',
    appId: '1:355154883318:android:6f24d31940e16b0450f2d7',
    messagingSenderId: '355154883318',
    projectId: 'expense-calculator-cd0cd',
    storageBucket: 'expense-calculator-cd0cd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWHuisvxKxuXzLAQ9CWvSTv2VZVODyjNQ',
    appId: '1:355154883318:ios:a06020eab59fe8fd50f2d7',
    messagingSenderId: '355154883318',
    projectId: 'expense-calculator-cd0cd',
    storageBucket: 'expense-calculator-cd0cd.appspot.com',
    iosBundleId: 'com.example.expenseCalculator',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCWHuisvxKxuXzLAQ9CWvSTv2VZVODyjNQ',
    appId: '1:355154883318:ios:a06020eab59fe8fd50f2d7',
    messagingSenderId: '355154883318',
    projectId: 'expense-calculator-cd0cd',
    storageBucket: 'expense-calculator-cd0cd.appspot.com',
    iosBundleId: 'com.example.expenseCalculator',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDUK8lKPkMhevkyaM2reo5vrcKrSAeLUuw',
    appId: '1:355154883318:web:31a3f189a902c76250f2d7',
    messagingSenderId: '355154883318',
    projectId: 'expense-calculator-cd0cd',
    authDomain: 'expense-calculator-cd0cd.firebaseapp.com',
    storageBucket: 'expense-calculator-cd0cd.appspot.com',
    measurementId: 'G-WC9M6NGTPJ',
  );
}
