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
    apiKey: 'AIzaSyD8qBfNvgDhic4AkYKGbhMV1UPmgSdZCCo',
    appId: '1:1070717245640:web:fbae136838b2a96225edfd',
    messagingSenderId: '1070717245640',
    projectId: 'rockid-30d56',
    authDomain: 'rockid-30d56.firebaseapp.com',
    databaseURL: 'https://rockid-30d56-default-rtdb.firebaseio.com',
    storageBucket: 'rockid-30d56.appspot.com',
    measurementId: 'G-J1QJ06PZLB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnBr91dXUQVMWr6xjYrK1rxj-4ICRDBMY',
    appId: '1:1070717245640:android:bc09187d766442e025edfd',
    messagingSenderId: '1070717245640',
    projectId: 'rockid-30d56',
    databaseURL: 'https://rockid-30d56-default-rtdb.firebaseio.com',
    storageBucket: 'rockid-30d56.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5K5mr2nb2ac6hwhjd8FEdKfW6xxeJzj4',
    appId: '1:1070717245640:ios:775a897805b4165725edfd',
    messagingSenderId: '1070717245640',
    projectId: 'rockid-30d56',
    databaseURL: 'https://rockid-30d56-default-rtdb.firebaseio.com',
    storageBucket: 'rockid-30d56.appspot.com',
    iosClientId: '1070717245640-5ek6j8392df6tc1hh21j1bbqj70pm48s.apps.googleusercontent.com',
    iosBundleId: 'com.example.rockid',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD5K5mr2nb2ac6hwhjd8FEdKfW6xxeJzj4',
    appId: '1:1070717245640:ios:27334b8dd309421125edfd',
    messagingSenderId: '1070717245640',
    projectId: 'rockid-30d56',
    databaseURL: 'https://rockid-30d56-default-rtdb.firebaseio.com',
    storageBucket: 'rockid-30d56.appspot.com',
    iosClientId: '1070717245640-878bvnq32ro4tsk14ninrjc6dpe1sht0.apps.googleusercontent.com',
    iosBundleId: 'com.example.rockid.RunnerTests',
  );
}
