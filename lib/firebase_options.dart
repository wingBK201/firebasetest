// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyCHTXvIwupL8GhMcTDtl6wAJH7RLDt7Ehc',
    appId: '1:206242677753:web:07ed0b4f160bad29cbb328',
    messagingSenderId: '206242677753',
    projectId: 'first-firebase-app-f26aa',
    authDomain: 'first-firebase-app-f26aa.firebaseapp.com',
    storageBucket: 'first-firebase-app-f26aa.appspot.com',
    measurementId: 'G-RDHVD3F5FN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5Y0pupMllNP8Y8BDqniaPAdDbb62C120',
    appId: '1:206242677753:android:c56e4ada4a288e32cbb328',
    messagingSenderId: '206242677753',
    projectId: 'first-firebase-app-f26aa',
    storageBucket: 'first-firebase-app-f26aa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaBamuovyAtQDlkzzZOEB7h-7IuQVFdas',
    appId: '1:206242677753:ios:c6cb79070c6cc380cbb328',
    messagingSenderId: '206242677753',
    projectId: 'first-firebase-app-f26aa',
    storageBucket: 'first-firebase-app-f26aa.appspot.com',
    iosBundleId: 'com.example.firebasetest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAaBamuovyAtQDlkzzZOEB7h-7IuQVFdas',
    appId: '1:206242677753:ios:7a345ebb3382110dcbb328',
    messagingSenderId: '206242677753',
    projectId: 'first-firebase-app-f26aa',
    storageBucket: 'first-firebase-app-f26aa.appspot.com',
    iosBundleId: 'com.example.firebasetest.RunnerTests',
  );
}