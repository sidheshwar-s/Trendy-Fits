// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA4_1KdJKXRFO69EFfyU0WqlNyxUePQV5w',
    appId: '1:15802377604:web:a1aac61aadd01b8f3769d1',
    messagingSenderId: '15802377604',
    projectId: 'trendy-fits',
    authDomain: 'trendy-fits.firebaseapp.com',
    storageBucket: 'trendy-fits.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZcmiPLXFcLg3Ph0pyfXB55My2Jg2wUDI',
    appId: '1:15802377604:android:d0652e26397af1713769d1',
    messagingSenderId: '15802377604',
    projectId: 'trendy-fits',
    storageBucket: 'trendy-fits.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAD9yRAZ7puKZskVfyLXH6sEMjXMP_DVys',
    appId: '1:15802377604:ios:cb0eb42076d9ea703769d1',
    messagingSenderId: '15802377604',
    projectId: 'trendy-fits',
    storageBucket: 'trendy-fits.appspot.com',
    iosClientId: '15802377604-r09059udj3dvcvmgjsarssuqbe5jgq47.apps.googleusercontent.com',
    iosBundleId: 'com.track',
  );
}
