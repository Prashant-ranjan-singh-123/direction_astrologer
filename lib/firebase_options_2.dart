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
class DefaultFirebaseOptionsTwo {
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
    apiKey: 'AIzaSyBbyILTPcsJSWtC09GVzSv5i3k0ogHi0ow',
    appId: '1:48721560774:web:fd467356c21c7e85c103c7',
    messagingSenderId: '48721560774',
    projectId: 'direction-84899',
    authDomain: 'direction-84899.firebaseapp.com',
    storageBucket: 'direction-84899.appspot.com',
    measurementId: 'G-60BW0MYKCL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5JrU9RLPIqN64JHoMtvElRhyHoh-qB5M',
    appId: '1:48721560774:android:306bb84c2bbe566bc103c7',
    messagingSenderId: '48721560774',
    projectId: 'direction-84899',
    storageBucket: 'direction-84899.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDl2ihyYEtKwsk4F-wkkR-r74TR8olBTjs',
    appId: '1:48721560774:ios:f391d152af02c529c103c7',
    messagingSenderId: '48721560774',
    projectId: 'direction-84899',
    storageBucket: 'direction-84899.appspot.com',
    androidClientId: '48721560774-6jntkr529a1du87nv7eiiitikm5avtfm.apps.googleusercontent.com',
    iosClientId: '48721560774-ba17dnigmffdctrt276h8v66rpf0ec9e.apps.googleusercontent.com',
    iosBundleId: 'com.project.direction',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDl2ihyYEtKwsk4F-wkkR-r74TR8olBTjs',
    appId: '1:48721560774:ios:a91e853e3cd06cefc103c7',
    messagingSenderId: '48721560774',
    projectId: 'direction-84899',
    storageBucket: 'direction-84899.appspot.com',
    androidClientId: '48721560774-6jntkr529a1du87nv7eiiitikm5avtfm.apps.googleusercontent.com',
    iosClientId: '48721560774-ciq90ffqa9hp0qt6emlcn9isoaq7h7q0.apps.googleusercontent.com',
    iosBundleId: 'com.example.direction',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBbyILTPcsJSWtC09GVzSv5i3k0ogHi0ow',
    appId: '1:48721560774:web:c6024eaf3b12d2e1c103c7',
    messagingSenderId: '48721560774',
    projectId: 'direction-84899',
    authDomain: 'direction-84899.firebaseapp.com',
    storageBucket: 'direction-84899.appspot.com',
    measurementId: 'G-J8PRH6FLKL',
  );

}