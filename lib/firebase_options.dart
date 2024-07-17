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
    apiKey: 'AIzaSyAY4QPZvvU5PNubngLPW6IwONRh8divw7A',
    appId: '1:682761545254:web:85b38755c16e52f7eee8e7',
    messagingSenderId: '682761545254',
    projectId: 'agora-chat-app-c03d6',
    authDomain: 'agora-chat-app-c03d6.firebaseapp.com',
    storageBucket: 'agora-chat-app-c03d6.appspot.com',
    measurementId: 'G-NNGYH8WHVW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxyWgGhpCbi1bJT_qi_3Z5YyxAnFIkmz0',
    appId: '1:682761545254:android:0195d6a656358c17eee8e7',
    messagingSenderId: '682761545254',
    projectId: 'agora-chat-app-c03d6',
    storageBucket: 'agora-chat-app-c03d6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAp52eilj7zRd7q_PAVbbcFiMQo7ZaeQ_8',
    appId: '1:682761545254:ios:7ca92e3b1e5027e0eee8e7',
    messagingSenderId: '682761545254',
    projectId: 'agora-chat-app-c03d6',
    storageBucket: 'agora-chat-app-c03d6.appspot.com',
    iosBundleId: 'com.example.agoraProject',
  );

}