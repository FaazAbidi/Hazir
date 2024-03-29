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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCKN8b0I_nmNEfdimUwLf9zXRNhEyG7Qfc',
    appId: '1:996752133533:web:045cd1ee2505b3abf9b374',
    messagingSenderId: '996752133533',
    projectId: 'hazir-bce97',
    authDomain: 'hazir-bce97.firebaseapp.com',
    storageBucket: 'hazir-bce97.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDeiIszaPyyeRQRMIvWxPFvX5sqBv_khDc',
    appId: '1:996752133533:android:b5cb9c215ff724abf9b374',
    messagingSenderId: '996752133533',
    projectId: 'hazir-bce97',
    storageBucket: 'hazir-bce97.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5zEG4sw6hoTgpwwC4bUnGtIVM5NMgwUs',
    appId: '1:996752133533:ios:195b9f31f90c2b6bf9b374',
    messagingSenderId: '996752133533',
    projectId: 'hazir-bce97',
    storageBucket: 'hazir-bce97.appspot.com',
    iosClientId: '996752133533-n1cfn3radqnafoaghfd2aen9999s48pi.apps.googleusercontent.com',
    iosBundleId: 'com.example.hazir',
  );
}
